import 'package:FMS/view/login/widgets/login_google_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:FMS/view/login/widgets/input_email_widget.dart';
import 'package:FMS/view/login/widgets/input_password_widget.dart';
import 'package:FMS/view/login/widgets/login_button_widget.dart';
import 'package:FMS/view_models/controller/login/login_controller.dart';

import '../../res/color/colors.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = Get.put(LoginViewModel());
  final loginVM = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "ĐĂNG NHẬP",
                style: TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
              const Text(
                "FPT Facility Management System",
                style: TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 15),
              ),
              const SizedBox(
                height: 60,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputEmailWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    InputPasswordWidget(),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              LoginButton(
                formKey: _formKey,
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: AppColor.primaryColor,
                thickness: 2,
                indent: 50,
                endIndent: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              LoginGoogleButton(),
            ],
          ),
        ),
      ),
    );
  }
}
