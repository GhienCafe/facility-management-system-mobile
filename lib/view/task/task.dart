import 'package:FMS/res/color/colors.dart';
import 'package:FMS/view/widget/bottom_navigation_bar.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  final RxInt currentIndex = 1.obs;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColor.whiteColor,
        title: const Text(
          "Working Task",
          style: TextStyle(color: AppColor.primaryColor),
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: const Icon(
        //         Icons.filter_alt_outlined,
        //         color: AppColor.primaryColor,
        //         size: 25,
        //       ))
        // ],
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                backgroundColor: AppColor.primaryColor,
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: TextStyle(color: AppColor.blackColor),
                height: 50,
                buttonMargin: const EdgeInsets.only(left: 20),
                labelStyle: const TextStyle(
                    color: AppColor.whiteColor, fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(
                    icon: Icon(Icons.format_list_bulleted),
                    text: "Tất Cả",
                  ),
                  Tab(
                    icon: Icon(Icons.timer),
                    text: "Đang Xử Lý",
                  ),
                  Tab(icon: Icon(Icons.done),
                    text: "Hoàn Thành",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    Center(
                      child: Icon(Icons.directions_car),
                    ),
                    Center(
                      child: Icon(Icons.directions_transit),
                    ),
                    Center(
                      child: Icon(Icons.directions_bike),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(currentIndex),
    ));
  }
}
