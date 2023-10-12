import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/color/colors.dart';

class CheckTask extends StatelessWidget {
  const CheckTask({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: AppColor.primaryColor,
            onPressed: () {
              Get.back();
              //Get.toNamed(RouteName.profileScreen);
            },
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFACCCC), Color(0xFFF6EFE9)],
                )),
          ),
          title: const Text(
            "Chi tiết nhiệm vụ",
            style: TextStyle(
              color: AppColor.primaryColor,
              letterSpacing: 1,
            ),
          ),
        ),
        body: const Center(
          child: Text("Check Task"),
        ),
      ),
    );
  }
}
