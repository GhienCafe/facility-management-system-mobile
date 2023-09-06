import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:FMS/res/color/colors.dart';

import '../../../utlis/utlis.dart';
import '../../../view_models/controller/login/login_controller.dart';

class InputEmailWidget extends StatelessWidget {
  InputEmailWidget({super.key});
  final loginVM = Get.put(LoginViewModel());

  // Regular expression for validating email with @fpt.edu.vn domain
  final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@fpt\.edu\.vn$');

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginVM.emailController.value,
      focusNode: loginVM.emailFocusNode.value,
      validator: (value) {
        if (value!.isEmpty) {
          return "Email không được để trống";
        } else if (!emailRegex.hasMatch(value)) {
          return "Email không hợp lệ";
        }
        return null;
      },
      onFieldSubmitted: (value) {
        Utlis.fieldFocusChange(context, loginVM.emailFocusNode.value,
            loginVM.passwordFocusNode.value);
      },
      decoration: InputDecoration(
        suffixIcon: const Icon(
          Icons.email_outlined,
          color: AppColor.primaryColor,
        ),
        hintText: "Email",
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColor.primaryColor), // Custom focused border color
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red), // Red border for errors
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}