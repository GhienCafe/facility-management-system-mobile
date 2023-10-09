import 'dart:async';

import 'package:FMS/res/color/colors.dart';
import 'package:FMS/res/routes/routes_name.dart';
import 'package:FMS/view/profile/profile_detail.dart';
import 'package:FMS/view/profile/terms_privacy.dart';
import 'package:FMS/view/widget/bottom_navigation_bar.dart';
import 'package:FMS/view_models/controller/user_prefrence/user_prefrence_view_model.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../view_models/controller/profile/profile_controller.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final RxInt currentIndex = 2.obs;
  UserPreference userPreference = UserPreference();
  final profileController = Get.put(ProfileController());
  final GoogleSignIn googleSignIn = GoogleSignIn(); // UserModel to store user information

  @override
  void initState() {
    super.initState();
    profileController.getCurrentUser();
  }

  Future<void> signOutGoogle() async {
    await FirebaseAuth.instance.signOut();
    await googleSignIn.disconnect();
    await googleSignIn.signOut();
  }


  Future<void> _handleLogout() async {
    await userPreference.removeUser();
    FirebaseAuth.instance.signOut();
    googleSignIn.disconnect();
    googleSignIn.signOut();
    Get.toNamed(RouteName.loginScreen);
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = profileController.currentUser.value.data;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xFFFACCCC), Color(0xFFF6EFE9)],
            )),
          ),
          title: const Text(
            "Menu",
            style: TextStyle(
              color: AppColor.primaryColor,
              letterSpacing: 1,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(userInfo?.avatar.toString() ?? "https://lordicon.com/icons/wired/gradient/306-avatar-icon-calm.svg"),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userInfo?.fullname.toString() ?? "",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        userInfo?.role == 3 ? "Staff" : "",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: const Text(
                      'Chỉnh sửa thông tin',
                      style: TextStyle(color: AppColor.primaryColor),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    iconColor: AppColor.primaryColor,
                    onTap: () {
                      Get.to(() => const ProfileDetail());
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text(
                      'Help & Support',
                      style: TextStyle(color: AppColor.primaryColor),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Get.to(() => AttentionPage());
                    },
                    iconColor: AppColor.primaryColor,
                    focusColor: AppColor.blackColor,
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.exit_to_app),
                    title: const Text(
                      'Logout',
                      style: TextStyle(color: AppColor.primaryColor),
                    ),
                    iconColor: AppColor.primaryColor,
                    onTap: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        headerAnimationLoop: false,
                        animType: AnimType.topSlide,
                        showCloseIcon: true,
                        closeIcon: const Icon(Icons.close_fullscreen_outlined),
                        title: 'Warning',
                        desc: 'Log Out Now ? ',
                        btnCancelOnPress: () {},
                        onDismissCallback: (type) {
                          debugPrint('Dialog Dismiss from callback $type');
                        },
                        btnOkOnPress: () {
                          _handleLogout();
                        },
                      ).show();
                    },
                  ),
                  const Divider(height: 1),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomBar(currentIndex),
      ),
    );
  }
}
