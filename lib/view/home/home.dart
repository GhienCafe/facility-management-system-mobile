import 'dart:js';

import 'package:FMS/view/widget/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:FMS/res/color/colors.dart';
import 'package:FMS/view/home/widgets/user_list_widget.dart';
import 'package:FMS/view_models/controller/user_prefrence/user_prefrence_view_model.dart';

import '../../view_models/controller/home/home_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final RxInt currentIndex = 0.obs;
  final homeController = Get.put(HomeController());
  UserPreference userPreference = UserPreference();
  @override
  void initState() {
    super.initState();
    homeController.userListApi();

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
            "FPT FMS",
            style: TextStyle(color: AppColor.primaryColor),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showNotificationPopup('Notification Title', 'Notification Description');
                },
                icon: const Icon(
                  Icons.add_alert,
                  color: AppColor.primaryColor,
                  size: 25,
                ))
          ],
        ),
        body: UserListWidget(),
        bottomNavigationBar: BottomBar(currentIndex),
      ),
    );
  }
}
void showNotificationPopup(String title, String description) {
  showDialog(
    context: context, // Ensure you have access to the context variable.
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog.
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
}


