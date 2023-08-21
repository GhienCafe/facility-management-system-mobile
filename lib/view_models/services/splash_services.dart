import 'dart:async';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mvvm/res/routes/routes_name.dart';
import 'package:mvvm/view_models/controller/user_prefrence/user_prefrence_view_model.dart';

class SplashService {
  UserPreference userPreference = UserPreference();
  void isLogin() {
    userPreference.getUser().then(
      (value) {
        // it value print the token
        print("is loadind value $isLogin");
        print("here is my token $value");
        // if (value.token?.isEmpty || value.token.toString() == "null") {
        //   Timer(const Duration(seconds: 3),
        //       () => Get.toNamed(RouteName.loginScreen));
        // } else {
        //   Timer(const Duration(seconds: 3),
        //       () => Get.toNamed(RouteName.homeScreen));
        // }
        if (value.isLogin == null || value.isLogin == false) {
          Timer(const Duration(seconds: 3),
              () => Get.toNamed(RouteName.loginScreen));
        } else {
          Timer(const Duration(seconds: 3),
              () => Get.toNamed(RouteName.homeScreen));
        }
      },
    );
  }
}
