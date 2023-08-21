import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:FMS/models/login/user_model.dart';
import 'package:FMS/res/repository/login_repository/login_repository.dart';
import 'package:FMS/res/routes/routes_name.dart';
import 'package:FMS/utlis/utlis.dart';
import 'package:FMS/view_models/controller/user_prefrence/user_prefrence_view_model.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

  UserPreference userPrefrence = UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  void loginApi() {
    print(emailController);
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };
    _api.loginApi(data).then((value) {
      loading.value = false;
      print(value);
      if (value['error'] == 'user not found') {
        Utlis.snackBar('Login', value['error']);
      } else {
        UserModel userModel = UserModel(
          token: value['token'],
          isLogin: true,
        );
        // we will this model in sharedprefences
        userPrefrence
            .saveUser(userModel)
            .then((value) => {
                  // for deelte the data from RAM after login
                  Get.delete<LoginViewModel>(),

                  Get.toNamed(RouteName.homeScreen)!.then((value) => {}),
                  Utlis.snackBar("Login", "login sucessfully"),
                })
            .onError((error, stackTrace) => {});
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utlis.snackBar('Error ', error.toString());
    });
  }
}
