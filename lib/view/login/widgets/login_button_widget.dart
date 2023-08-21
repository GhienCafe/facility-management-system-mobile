import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/components/round_button.dart';
import '../../../view_models/controller/login/login_controller.dart';

class LoginButton extends StatelessWidget {
  final formKey;
  LoginButton({super.key, required this.formKey});
  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RoundButton(
        loading: loginVM.loading.value,
        onPress: () {
          if (formKey.currentState!.validate()) {
            loginVM.loginApi();
          }
        },
        title: "Login",
        width: 500,
      ),
    );
  }
}
