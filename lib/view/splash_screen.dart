import 'package:FMS/res/assets/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:FMS/res/color/colors.dart';
import 'package:FMS/view_models/services/splash_services.dart';

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
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFECC74B),
                Color(0xFFD23939),
              ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  ImageAssets.splashImageScreen,
                  height: 300.0,
                  width: 300.0,
                ),
                const Text(
                  "FFMS\n FPT Facility Management System",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFE0D3B3),
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    fontSize: 25.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
