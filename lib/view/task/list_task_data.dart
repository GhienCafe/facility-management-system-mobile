import 'package:FMS/data/response/status.dart';
import 'package:FMS/models/task/tasks_list_model.dart';
import 'package:FMS/view/widget/loading_list.dart';
import 'package:FMS/view_models/controller/task/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../res/color/colors.dart';
import 'package:get/get.dart';

import '../../res/components/general_exception.dart';
import '../../res/components/internet_exception_widget.dart';

class DataListWidget extends StatelessWidget {
  //final List<TaskListModel> items;
  final taskController = Get.put(TaskController());
  DataListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (taskController.rxRequestStatus.value) {
        case StatusAPI.LOADING:
          return const LoadingListPage();
        case StatusAPI.COMPLETED:
          return Container(
            margin: const EdgeInsets.only(top: 10),
            child: ListView.builder(
              itemCount: taskController.taskList.value.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final task = taskController.taskList.value.data![index];
                String? jsonDateString = task.createdAt;
                DateTime date = DateTime.parse(jsonDateString!);
                String formattedDate = DateFormat('dd-MM-yyyy').format(date);
                IconData statusIcon;
                Color statusColor;
                switch (task.status?.value) {
                  case 1:
                    statusIcon = Icons.insights;
                    statusColor = Colors.orange;
                    break;
                  case 2:
                    statusIcon = Icons.task;
                    statusColor = Colors.orange;
                    break;
                  case 3:
                    statusIcon = Icons.check_circle;
                    statusColor = Colors.green;
                    break;
                  default:
                    statusIcon = Icons.error;
                    statusColor = Colors.red;
                }
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 170,
                    width: double.infinity,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(25),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFEE873E),
                            Color(0xFFE8983A),
                            Color(0xFFE8A91E),
                            Colors.purpleAccent,
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(
                            15))), // Adds a gradient background and rounded corners to the container
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 280,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(task.title.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontFamily: "monospace")),
                              Text(task.content.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontFamily: "monospace")),
                              SizedBox(height: 10),
                              Text(formattedDate,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Stack(
                          children: List.generate(
                            1,
                            (index) => Container(
                              margin: EdgeInsets.only(
                                  left: (15 * index).toDouble()),
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  color: AppColor.whiteColor),
                              child: Icon(
                                statusIcon,
                                color: statusColor,
                              ),
                            ),
                          ),
                        ),
                        // Adds a price to the bottom of the card
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        case StatusAPI.ERROR:
          if (taskController.error.value == 'No internet') {
            return InternetExceptionWidget(
              onPress: () {
                taskController.refreshApi();
              },
            );
          } else {
            return GeneralExceptionWidget(onPress: () {
              taskController.refreshApi();
            }); // Return the Text widget
          }
      }
    });
  }
}

class MyTextSample {
  static TextStyle? headline(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall;
  }

  static TextStyle? body2(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge;
  }
}
