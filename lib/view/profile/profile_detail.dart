import 'dart:async';

import 'package:FMS/view/profile/profile_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/color/colors.dart';
import '../../view_models/controller/profile/profile_controller.dart';
import '../widget/display_image_profile.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({super.key});

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  final profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    //profileController.getCurrentUser(); // Load user information when the page initializes
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = profileController.currentUser.value.data;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: const BackButton(color: AppColor.whiteColor),
            automaticallyImplyLeading: false,
            centerTitle: true,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFACCCC), Color(0xFFF6EFE9)],
                  )),
            ),
            title: const Text(
              "Thông Tin Cá Nhân",
              style: TextStyle(
                color: AppColor.primaryColor,
                letterSpacing: 1,
              ),
            ),
          ),
          body: Column(
            children: [
              const SizedBox(height: 5),
              InkWell(
                  onTap: () {
                    //navigateSecondPage(EditImagePage());
                    Get.to(() => ImageUploads());
                  },
                  child: DisplayImage(
                    imagePath:
                    userInfo!.avatar.toString(),
                    onPressed: () {},
                  )),
              buildUserInfoDisplay(
                  userInfo!.fullname.toString(), 'Họ Tên'),
              buildUserInfoDisplay(
                  userInfo!.role == 3
                      ? "Staff"
                      : userInfo!.role == 2
                      ? "Manager"
                      : "",
                  'Chức Vụ'),
              buildUserInfoDisplay(
                  userInfo!.email.toString(), 'Email'),
              buildUserInfoDisplay(
                  userInfo!.phoneNumber.toString(), 'Số Điện Thoại'),
              buildUserInfoDisplay(
                  userInfo!.address.toString(), 'Địa Chỉ'),
            ],
          ),
        ));
  }

  // Widget builds the display item with the proper formatting to display the user's info
  Widget buildUserInfoDisplay(String getValue, String title) => Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Container(
              width: double.infinity,
              height: 40,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                        color: AppColor.primaryColor,
                        width: 1,
                      ))),
              child: Row(children: [
                Expanded(
                    child: Text(
                      getValue,
                      style: const TextStyle(
                          fontSize: 20, height: 1.4, fontWeight: FontWeight.w400),
                    )),
              ]))
        ],
      ));

  // Refrshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}