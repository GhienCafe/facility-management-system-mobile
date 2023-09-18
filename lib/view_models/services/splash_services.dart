import 'dart:async';

import 'package:FMS/res/repository/login_repository/login_repository.dart';
import 'package:FMS/utlis/utlis.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
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
                  Utlis.snackBar("Đăng Nhập Không Hợp Lệ", "Hãy Đăng Nhập Lại"),
                  Get.toNamed(RouteName.loginScreen)
                });
      } else {
        Timer(
            const Duration(seconds: 3),
            () => {
                  Utlis.snackBar("Xin chào", "Chúc Một Ngày Tốt Lành"),
                  Get.toNamed(RouteName.homeScreen)
                });
      }
    }).onError((error, stackTrace) {
      Utlis.snackBar('Something wrong: ', "Please try again");
      Get.toNamed(RouteName.loginScreen);
    });
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
