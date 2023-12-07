import 'dart:async';

import 'package:FMS/models/login/users_model.dart';
import 'package:FMS/res/repository/login_repository/login_repository.dart';
import 'package:FMS/utlis/utlis.dart';
import 'package:awesome_notifications_fcm/awesome_notifications_fcm.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:FMS/res/routes/routes_name.dart';
import 'package:FMS/view_models/controller/user_prefrence/user_prefrence_view_model.dart';

import '../controller/notification/notification_controller.dart';

class SplashService {
  final _api = LoginRepository();
  RxBool loading = false.obs;
  UserPreference userPreference = UserPreference();
  final notificationController = Get.put(NotificationController());
  void checkTokenValid() async {
    _api.checkAccessToken().then((value) {
      if (value['status_code'] != 200) {
        refreshToken();
      } else {
        notificationController.notificationList;
        saveFCMToken();
        Timer(
            const Duration(seconds: 2),
            () => {
                  Utils.snackBarSuccess("Xin chào", "Chúc Một Ngày Tốt Lành"),
                  Get.toNamed(RouteName.homeScreen)
                });
      }
    }).onError((error, stackTrace) {
      Utils.snackBarError("Đăng Nhập Không Hợp Lệ", "Hãy Đăng Nhập Lại");
      Get.toNamed(RouteName.loginScreen);
    });
  }

  void refreshToken() async {
    UsersModel userInfo = await userPreference.getUserInfo();
    Map data = {"refresh_token": userInfo.data?.refreshToken};
    _api.refreshToken(data).then((value) {
      if (value["status_code"] != 200) {
        userPreference.removeUser();
        Timer(
            const Duration(seconds: 1),
            () => {
                  Utils.snackBarError(
                      "Đăng Nhập Không Hợp Lệ", "Hãy Đăng Nhập Lại"),
                  Get.toNamed(RouteName.loginScreen)
                });
      } else {
        UsersModel userModel = UsersModel.fromJson(value);
        userPreference.removeUser();
        userPreference
            .saveUserInfoPreferences(userModel)
            .then((value) => {
                  notificationController.notificationList,
                  Timer(
                    const Duration(seconds: 2),
                    () => {
                      Get.toNamed(RouteName.homeScreen)!.then((value) => {}),
                      Utils.snackBarSuccess(
                          "Xin chào", "Chúc Một Ngày Tốt Lành"),
                      saveFCMToken(),
                    },
                  ),
                })
            .onError((error, stackTrace) => {});
      }
    });
  }

  Future<void> saveFCMToken() async {
    final FCMToken = await AwesomeNotificationsFcm().requestFirebaseAppToken();
    try {
      Map data = {'token': FCMToken};
      await _api.saveFCMToken(data);
    } catch (error) {
      loading.value = false;
      if (kDebugMode) {
        print('Something wrong: ${error.toString()}');
      }
    }
  }

  void isLogin() {
    userPreference.getUserInfo().then(
      (value) {
        var token = value.data!.accessToken.toString();
        if (token.isEmpty || token == "null") {
          Timer(const Duration(seconds: 3),
              () => Get.toNamed(RouteName.loginScreen));
        } else {
          checkTokenValid();
        }
      },
    );
  }
}
