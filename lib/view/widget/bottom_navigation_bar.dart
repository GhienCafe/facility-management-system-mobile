import 'package:FMS/res/color/colors.dart';
import 'package:FMS/res/routes/routes_name.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBar extends StatefulWidget {
  final RxInt currentIndex;
  const BottomBar(this.currentIndex, {super.key});
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ConvexAppBar(
        initialActiveIndex: widget.currentIndex.value, // Use the current index from GetX
        items: const [
          TabItem(
            icon: Icon(Icons.home_outlined, color: AppColor.whiteColor),
            activeIcon: Icon(Icons.home_outlined, color: AppColor.primaryColor),
            title: 'Home',
          ),
          TabItem(
            icon: Icon(Icons.task_outlined, color: AppColor.whiteColor),
            activeIcon: Icon(Icons.task_outlined, color: AppColor.primaryColor),
            title: 'Task',
          ),
          TabItem(
            icon: Icon(Icons.reorder, color: AppColor.whiteColor),
            activeIcon: Icon(Icons.reorder, color: AppColor.primaryColor),
            title: 'More',
          ),
        ],
        shadowColor: AppColor.blackColor,
        color: AppColor.whiteColor,
        backgroundColor: AppColor.primaryColor,
        style: TabStyle.reactCircle,
        onTap: (index) {
          widget.currentIndex.value = index;
          switch (index) {
            case 0:
              Get.toNamed(RouteName.homeScreen);
              break;
            case 1:
              Get.toNamed(RouteName.taskScreen);
              break;
            case 2:
              Get.toNamed(RouteName.profileScreen);
              break;
          }
        },
      );
    });
  }
}
