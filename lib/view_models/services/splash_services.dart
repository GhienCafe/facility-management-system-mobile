import 'dart:async';

import 'package:FMS/res/repository/login_repository/login_repository.dart';
import 'package:FMS/utlis/utlis.dart';
import 'package:awesome_notifications_fcm/awesome_notifications_fcm.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:FMS/res/routes/routes_name.dart';
import 'package:FMS/view_models/controller/user_prefrence/user_prefrence_view_model.dart';

class SplashService {
  final _api = LoginRepository();

  RxBool loading = false.obs;
  UserPreference userPreference = UserPreference();
  void checkTokenValid() async{
    _api.checkAccessToken().then((value) {
      if (value['status_code'] != 200) {
        userPreference.removeUser();
        Timer(
            const Duration(seconds: 3),
            () => {
                  Utils.snackBar("Đăng Nhập Không Hợp Lệ", "Hãy Đăng Nhập Lại"),
                  Get.toNamed(RouteName.loginScreen)
                });
      } else {
        saveFCMToken();
        Timer(
            const Duration(seconds: 3),
            () => {
                  Utils.snackBar("Xin chào", "Chúc Một Ngày Tốt Lành"),
                  Get.toNamed(RouteName.homeScreen)
                });
      }
    }).onError((error, stackTrace) {
      Utils.snackBar('Something wrong: ', "Please try again");
      Get.toNamed(RouteName.loginScreen);
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
        print("check accessToken: ${value.data?.accessToken.toString()}");
        var token = value.data!.accessToken.toString();

        if (token.isEmpty || token == "null") {
          Timer(const Duration(seconds: 3),
              () => Get.toNamed(RouteName.loginScreen));
        } else {
          //Get.toNamed(RouteName.loginScreen);
          checkTokenValid();
        }
      },
    );
  }
}
