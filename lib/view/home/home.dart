import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:FMS/res/color/colors.dart';
import 'package:FMS/res/routes/routes_name.dart';
import 'package:FMS/view/home/widgets/user_list_widget.dart';
import 'package:FMS/view_models/controller/user_prefrence/user_prefrence_view_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../view_models/controller/home/home_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final homeController = Get.put(HomeController());
  UserPreference userPreference = UserPreference();
  @override
  void initState() {
    super.initState();
    homeController.userListApi();

  }
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
            "Home screen",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  userPreference.removeUser().then((value) => {
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
        body: UserListWidget(),
      ),
    );
  }
}
