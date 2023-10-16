import 'package:FMS/data/response/status.dart';
import 'package:FMS/view/task/task_detail/check_task.dart';
import 'package:FMS/view/task/task_detail/maintain_task.dart';
import 'package:FMS/view/task/task_detail/repair_task.dart';
import 'package:FMS/view/task/task_detail/replace_task.dart';
import 'package:FMS/view/task/task_detail/transfer_task.dart';
import 'package:FMS/view/widget/loading_list.dart';
import 'package:FMS/view_models/controller/task/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../res/color/colors.dart';
import 'package:get/get.dart';

import '../../res/components/general_exception.dart';
import '../../res/components/internet_exception_widget.dart';

class DataListWidget extends StatelessWidget {
  final taskController = Get.put(TaskController());
  DataListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
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
                  String? jsonDateString = task.requestDate;
                  DateTime date = DateTime.parse(jsonDateString!);
                  String formattedDate = DateFormat('dd-MM-yyyy').format(date);
                  IconData statusIcon;
                  Color statusColor;
                  switch (task.status) {
                    case 1:
                      statusIcon = Icons.insights;
                      statusColor = Colors.orange;
                      break;
                    case 2:
                      statusIcon = Icons.schedule_send;
                      statusColor = Colors.blue;
                      break;
                    case 3:
                      statusIcon = Icons.assignment_turned_in;
                      statusColor = Colors.green;
                      break;
                    case 4:
                      statusIcon = Icons.highlight_off;
                      statusColor = Colors.grey;
                      break;
                    default:
                      statusIcon = Icons.error;
                      statusColor = Colors.red;
                  }
                  return GestureDetector(
                    onTap: () {
                      switch (task.type) {
                        case 1:
                          taskController.taskDetailApi(task.id);
                          Get.to(() => CheckTask(taskId: task.id));
                          break;
                        case 2:
                          taskController.taskDetailApi(task.id);
                          Get.to(() => MaintainTask(taskId: task.id));
                          break;
                        case 3:
                          taskController.taskDetailApi(task.id);
                          Get.to(() => RepairTask(taskId: task.id));
                          break;
                        case 4:
                          taskController.taskDetailApi(task.id);
                          Get.to(() => ReplaceTask(taskId: task.id));
                          break;
                        case 5:
                          taskController.taskDetailApi(task.id);
                          Get.to(() => TransferTask(taskId: task.id));
                          break;
                        default:
                          // Handle the default case if needed
                          break;
                      }
                    },
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
                            Color(0xFFE1AE3B),
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 270,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: Text(
                                      task.typeObj!.displayName.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          wordSpacing: 1,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(
                                  height: 55,
                                  child: Text(task.description.toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      )),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(Icons.event,
                                        color: AppColor.whiteColor, size: 15),
                                    Text(formattedDate,
                                        style: const TextStyle(
                                            fontSize: 17, color: Colors.white)),
                                    const SizedBox(width: 20),
                                    Text("ID: ${task.requestCode.toString()}",
                                        style: const TextStyle(
                                            fontSize: 17, color: Colors.white)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const VerticalDivider(
                              thickness: 1, color: AppColor.whiteColor),
                          Stack(
                            children: List.generate(
                              1,
                              (index) => Container(
                                margin: EdgeInsets.only(
                                    left: (10 * index).toDouble()),
                                height: 35,
                                width: 35,
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
              });
            }
        }
      },
    );
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
