import 'package:FMS/res/color/colors.dart';
import 'package:FMS/view/widget/bottom_navigation_bar.dart';
import 'package:FMS/view/widget/loading_list.dart';
import 'package:FMS/view_models/controller/task/task_controller.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'list_task_data.dart';

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  final TaskController taskController = Get.put(TaskController());
  final RxInt currentIndex = 1.obs;
  int selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void refreshData() {
    if (selectedTabIndex == 0) {
      taskController.fetchAllData();
    } else if (selectedTabIndex == 1) {
      taskController.fetchProcessingData();
    } else if (selectedTabIndex == 2) {
      taskController.fetchCompletedData();
    }
  }

  Widget buildLoadingPage() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child:  DefaultTabController(
          length: 3,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                backgroundColor: AppColor.primaryColor,
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: const TextStyle(color: AppColor.blackColor),
                height: 40,
                buttonMargin: const EdgeInsets.only(left: 10, right: 10),
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
                  Tab(
                    icon: Icon(Icons.done),
                    text: "Hoàn Thành",
                  ),
                ],
              ),
              const Expanded(
                child: LoadingListPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLoadedPage() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: DefaultTabController(
          length: 3,
          child:
          Column(
            children: <Widget>[
              ButtonsTabBar(
                backgroundColor: AppColor.primaryColor,
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: const TextStyle(color: AppColor.blackColor),
                height: 40,
                buttonMargin: const EdgeInsets.only(left: 10, right: 10),
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
                  Tab(
                    icon: Icon(Icons.done),
                    text: "Hoàn Thành",
                  ),
                ],
                onTap: (index) {
                  // Fetch data for the selected tab
                  if (index == 0) {
                    taskController.fetchAllData();
                  } else if (index == 1) {
                    taskController.fetchProcessingData();
                  } else if (index == 2) {
                    taskController.fetchCompletedData();
                  }
                },
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    DataListWidget(taskController.allItems),
                    DataListWidget(taskController.processingItems),
                    DataListWidget(taskController.completedItems),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFACCCC), Color(0xFFF6EFE9)],
                )
            ),
          ),
          title: const Text(
            "Công Việc",
            style: TextStyle(color: AppColor.primaryColor),
          ),
          actions: [
            IconButton(
              onPressed: () {
                refreshData();
              },
              icon: const Icon(
                Icons.refresh,
                color: AppColor.primaryColor,
                size: 25,
              ),
            )
          ],
        ),
        body: Obx(() {
          return taskController.isLoading.value ? buildLoadingPage() : buildLoadedPage();
        }),
        bottomNavigationBar: BottomBar(currentIndex),
      ),
    );
  }
}
