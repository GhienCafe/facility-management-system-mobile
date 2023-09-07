import 'package:FMS/res/color/colors.dart';
import 'package:FMS/res/routes/routes_name.dart';
import 'package:FMS/view/widget/bottom_navigation_bar.dart';
import 'package:FMS/view_models/controller/user_prefrence/user_prefrence_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final RxInt currentIndex = 2.obs;
  UserPreference userPreference = UserPreference();
  //final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<void> signOutGoogle() async {
    await FirebaseAuth.instance.signOut();
    await googleSignIn.signOut();
    print("User now: ${FirebaseAuth.instance.currentUser!.email}");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: AppColor.primaryColor,
            title: const Text(
              "Profile screen",
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                  onPressed: () async {
                    userPreference.removeUser().then((value) => {
                          signOutGoogle(),
                          Get.toNamed(RouteName.loginScreen),
                        });
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 25,
                  ))
            ],
          ),
          body: Center(
            child: Text('Profile Page'),
          ),
          bottomNavigationBar: BottomBar(currentIndex),
        ));
  }
}
