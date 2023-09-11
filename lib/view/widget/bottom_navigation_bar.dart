import 'package:FMS/res/color/colors.dart';
import 'package:FMS/res/routes/routes_name.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
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
      return CurvedNavigationBar(
          index: widget.currentIndex.value, // Sử dụng giá trị _page từ GetX
          items: const [
            CurvedNavigationBarItem(
              child: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.task_outlined),
              label: 'Task',
            ),
            // CurvedNavigationBarItem(
            //   child: Icon(Icons.chat_bubble_outline),
            //   label: 'Chat',
            // ),
            // CurvedNavigationBarItem(
            //   child: Icon(Icons.newspaper),
            //   label: 'Feed',
            // ),
            CurvedNavigationBarItem(
              child: Icon(Icons.perm_identity),
              label: 'Personal',
            ),
          ],
          color: AppColor.whiteColor,
          buttonBackgroundColor: Colors.white,
          backgroundColor: AppColor.primaryColor,
          animationCurve: Curves.linearToEaseOut,
          animationDuration: const Duration(milliseconds: 100),
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
          letIndexChange: (index) => true,
        );
    });
  }
}