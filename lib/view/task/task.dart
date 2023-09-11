import 'package:FMS/res/color/colors.dart';
import 'package:FMS/view/widget/bottom_navigation_bar.dart';
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
            actions: [
              IconButton(
                  onPressed: () {

                  },
                  icon: const Icon(
                    Icons.filter_alt_outlined,
                    color: AppColor.primaryColor,
                    size: 25,
                  ))
            ],
          ),
          body: Center(
            child: Text('Task Page'),
          ),
      bottomNavigationBar: BottomBar(currentIndex),
    ));
  }
}
