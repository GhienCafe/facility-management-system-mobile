import 'dart:async';

import 'package:FMS/view/profile/profile_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/login/users_model.dart';
import '../../res/color/colors.dart';
import '../../view_models/controller/user_prefrence/user_prefrence_view_model.dart';
import '../widget/display_image_profile.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({super.key});

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  UserPreference userPreference = UserPreference();
  UsersModel? _user;

  @override
  void initState() {
    super.initState();
    _loadUserInfo(); // Load user information when the page initializes
  }

  Future<void> _loadUserInfo() async {
    UsersModel user = await userPreference.getUserInfo();
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(height: 10),
          InkWell(
              onTap: () {
                //navigateSecondPage(EditImagePage());
                Get.to(() => ImageUploads());
              },
              child: DisplayImage(
                imagePath:
                    "https://media.istockphoto.com/id/1144760419/vi/vec-to/avatar-d%E1%BB%8Bch-v%E1%BB%A5-h%E1%BB%97-tr%E1%BB%A3.jpg?s=170667a&w=0&k=20&c=6Zv7ZXrA5kGhlqTRaeFeYvp_ItVEqQMolars12WWE04=",
                onPressed: () {},
              )),
          buildUserInfoDisplay(
              _user != null ? _user!.data?.fullname ?? "" : "", 'Name'),
          buildUserInfoDisplay(
              _user != null
                  ? _user!.data?.role == 3
                      ? "Staff"
                      : _user!.data?.role == 2
                          ? "Manager"
                          : ""
                  : "",
              'Role'),
          buildUserInfoDisplay(
              _user != null ? _user!.data?.email ?? "" : "", 'Email'),
        ],
      ),
    ));
  }

  // Widget builds the display item with the proper formatting to display the user's info
  Widget buildUserInfoDisplay(String getValue, String title) => Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColor.primaryColor,
            ),
          ),
          const SizedBox(height: 10),
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
                      fontSize: 20, height: 1.4, fontWeight: FontWeight.w500),
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
