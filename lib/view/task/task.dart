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
      // appBar: AppBar(
      //   title: Text(
      //     "Home screen",
      //     style: TextStyle(color: Colors.white),
      //   ),
      // ),
          body: Center(
            child: Text('Task Page'),
          ),
      bottomNavigationBar: BottomBar(currentIndex),
    ));
  }
}
