import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/color/colors.dart';
import '../../../view_models/controller/login/login_controller.dart';

class InputPasswordWidget extends StatefulWidget {
  InputPasswordWidget({super.key});

  @override
  State<InputPasswordWidget> createState() => _InputPasswordWidgetState();
}

class _InputPasswordWidgetState extends State<InputPasswordWidget> {
  bool ot = true;

  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: ot,
      controller: loginVM.passwordController.value,
      focusNode: loginVM.passwordFocusNode.value,
      obscuringCharacter: '*',
      // obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return "Mật khẩu không được để trống";
        } else if (value.length <= 5) {
          return "Mật khẩu tối thiểu 5 kí tự";
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              ot = !ot;
            });
          },
          icon: Icon(
            ot ? Icons.visibility : Icons.visibility_off,
            color: AppColor.primaryColor,
          ),
        ),
        hintText: "Mật khẩu",
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColor.primaryColor), // Custom focused border color
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
