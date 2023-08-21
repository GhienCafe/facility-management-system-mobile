import 'package:flutter/material.dart';
import 'package:mvvm/res/color/colors.dart';
import 'package:mvvm/view_models/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService splashScreen = SplashService();
  @override
  void initState() {
    super.initState();
    splashScreen.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
          child: Text(
        "Welcome Back",
        style: TextStyle(color: Colors.white, fontSize: 30),
      )),
    );
  }
}
