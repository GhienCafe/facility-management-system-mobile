import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/components/round_button.dart';
import '../../../view_models/controller/login/login_controller.dart';

class LoginGoogleButton extends StatelessWidget {
  LoginGoogleButton({super.key});
  final loginVM = Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    return Obx(
          () => RoundButton(
        loading: loginVM.loading.value,
        onPress: () async {
          await loginVM.handleSignIn();
        },
        title: "Đăng Nhập Với Google" ,
        width: 500,
      ),
    );
  }
}
