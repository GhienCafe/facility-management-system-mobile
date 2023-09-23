import 'dart:async';

import 'package:FMS/models/login/users_model.dart';
import 'package:FMS/res/color/colors.dart';
import 'package:FMS/res/routes/routes_name.dart';
import 'package:FMS/view/widget/bottom_navigation_bar.dart';
import 'package:FMS/view_models/controller/user_prefrence/user_prefrence_view_model.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final RxInt currentIndex = 2.obs;
  UserPreference userPreference = UserPreference();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  UsersModel? _user; // UserModel to store user information

  @override
  void initState() {
    super.initState();
    _loadUserInfo(); // Load user information when the page initializes
  }

  Future<void> signOutGoogle() async {
    await FirebaseAuth.instance.signOut();
    await googleSignIn.disconnect();
    await googleSignIn.signOut();
  }

  Future<void> _loadUserInfo() async {
    UsersModel user = await userPreference.getUserInfo();
    setState(() {
      _user = user;
    });
  }

  Future<void> _handleLogout() async {
    // Clear SharedPreferences
    await userPreference.removeUser();

    // Perform Google logout
    await signOutGoogle();

    // Navigate to the login screen
    Get.toNamed(RouteName.loginScreen);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: AppColor.whiteColor,
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
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      "https://media.istockphoto.com/id/1144760419/vi/vec-to/avatar-d%E1%BB%8Bch-v%E1%BB%A5-h%E1%BB%97-tr%E1%BB%A3.jpg?s=170667a&w=0&k=20&c=6Zv7ZXrA5kGhlqTRaeFeYvp_ItVEqQMolars12WWE04=",
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _user != null ? _user!.data?.fullname ?? "" : "",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _user != null
                            ? _user!.data?.role == 3
                            ? "Staff"
                            : _user!.data?.role == 2
                            ? "Manager"
                            : ""
                            : "",
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
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text(
                      'Help & Support',
                      style: TextStyle(color: AppColor.primaryColor),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {},
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
