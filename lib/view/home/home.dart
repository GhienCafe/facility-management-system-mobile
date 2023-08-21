import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/res/color/colors.dart';
import 'package:mvvm/res/routes/routes_name.dart';
import 'package:mvvm/view/home/widgets/user_list_widget.dart';
import 'package:mvvm/view_models/controller/user_prefrence/user_prefrence_view_model.dart';

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
                onPressed: () {
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
