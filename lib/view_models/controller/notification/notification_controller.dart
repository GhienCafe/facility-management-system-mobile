import 'dart:async';

import 'package:FMS/models/notification/notification_model.dart';
import 'package:FMS/res/repository/notification_repository/notification_repository.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:awesome_notifications_fcm/awesome_notifications_fcm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/response/status.dart';
import '../../../utlis/utlis.dart';

class NotificationController {
  final _api = NotificationRepository();
  final rxRequestStatus = StatusAPI.LOADING.obs;
  final notificationList = NotificationListModel().obs;
  RxString error = ''.obs;
  void setRexRequestStatus(StatusAPI _value) => rxRequestStatus.value = _value;
  void setNotificationList(NotificationListModel _value) =>
      notificationList.value = _value;
  void setError(String _value) => error.value = _value;

  void notificationListApi() {
    _api
        .notificationListApi()
        .then((value) => {
              setRexRequestStatus(StatusAPI.COMPLETED),
              setNotificationList(value),
            })
        .onError((error, stackTrace) => {
              setError(error.toString()),
              setRexRequestStatus(StatusAPI.ERROR),
            });
  }

  void readNotification(String id){
    _api.readNotificationApi(id).then((value) {
      if (value['status_code'] == 200 || value['status_code'] == 201) {
        refreshApi();
      } else {
        //Utils.snackBarError("Thông báo", "Báo cáo không thành công");
      }
    }).onError((error, stackTrace) {
      Utils.snackBar('Có lỗi xảy ra: ', error.toString());
    });
  }

  void readAllNotification(){
    _api.readAllNotificationApi().then((value) {
      if (value['status_code'] == 200 || value['status_code'] == 201) {
        refreshApi();
      } else {
        //Utils.snackBarError("Thông báo", "Báo cáo không thành công");
      }
    }).onError((error, stackTrace) {
      Utils.snackBar('Có lỗi xảy ra: ', error.toString());
    });
  }

  void refreshApi() {
    setRexRequestStatus(StatusAPI.LOADING);
    _api
        .notificationListApi()
        .then((value) => {
              setRexRequestStatus(StatusAPI.COMPLETED),
              setNotificationList(value),
            })
        .onError((error, stackTrace) => {
              setError(error.toString()),
              setRexRequestStatus(StatusAPI.ERROR),
            });
  }

  static Future<void> initializeLocalNotifications(
      {required bool debug}) async {
    await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
              channelKey: 'alerts',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              importance: NotificationImportance.High,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange)
        ],
        debug: debug);
  }

  // Hàm này dùng để Khởi tạo Push Notification.
  static Future<void> initializeRemoteNotifications(
      {required bool debug}) async {
    await Firebase.initializeApp();
    await AwesomeNotificationsFcm().initialize(
        // Handle Silent data
        onFcmSilentDataHandle: NotificationController.mySilentDataHandle,
        // Method này dùng để phát hiện khi nhận được fcm token mới.
        onFcmTokenHandle: NotificationController.myFcmTokenHandle,
        // Method này dùng để phát hiện khi nhận được native token mới.
        onNativeTokenHandle: NotificationController.myNativeTokenHandle,

        // This license key is necessary only to remove the watermark for
        // push notifications in release mode. To know more about it, please
        // visit http://awesome-notifications.carda.me#prices
        licenseKeys: null,
        debug: debug);
  }

  // Chỗ này để lấy cái FCM Token của thiết bị nè.
  Future<String> requestFirebaseToken() async {
    if (await AwesomeNotificationsFcm().isFirebaseAvailable) {
      try {
        final token = await AwesomeNotificationsFcm().requestFirebaseAppToken();
        print('==================FCM Token==================');
        print(token);
        print('======================================');
        return token;
      } catch (exception) {
        debugPrint('$exception');
      }
    } else {
      debugPrint('Firebase is not available on this project');
    }
    return '';
  }

  Future<void> checkPermission() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }
  }

  // Hàm gọi Local notification khi nhấn nút Send notification trên ứng dụng
  Future<void> localNotification() async {
    //String timezone = await AwesomeNotifications().getLocalTimeZoneIdentifier();
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'alerts',
        title: 'This is Notification',
        bigPicture:
            'https://images.pexels.com/photos/14679216/pexels-photo-14679216.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        notificationLayout: NotificationLayout.BigPicture,
      ),
    );
  }

  /// Use this method to execute on background when a silent data arrives
  /// (even while terminated)
  @pragma("vm:entry-point")
  static Future<void> mySilentDataHandle(FcmSilentData silentData) async {
    print('"SilentData": ${silentData.toString()}');

    if (silentData.createdLifeCycle != NotificationLifeCycle.Foreground) {
      print("bg");
    } else {
      print("FOREGROUND");
    }

    print("starting long task");
    await Future.delayed(Duration(seconds: 4));
    // final re = await http.get(url);
    // print(re.body);
    print("long task done");
  }

  /// Use this method to detect when a new fcm token is received
  @pragma("vm:entry-point")
  static Future<void> myFcmTokenHandle(String token) async {
    debugPrint('FCM Token:"$token"');
  }

  /// Use this method to detect when a new native token is received
  @pragma("vm:entry-point")
  static Future<void> myNativeTokenHandle(String token) async {
    debugPrint('Native Token:"$token"');
  }
}
