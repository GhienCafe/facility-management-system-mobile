import 'package:FMS/data/response/status.dart';
import 'package:FMS/view/task/task_detail/check_task.dart';
import 'package:FMS/view/task/task_detail/inventory_task.dart';
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
  final taskController = Get.find<TaskController>();
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
                itemCount: taskController.taskList.value.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  final task = taskController.taskList.value.data![index];
                  String? jsonDateString = task.requestDate;
                  String nonNullableString =
                      jsonDateString ?? "0000-00-00T08:53:33.0000694";
                  DateTime date = DateTime.parse(nonNullableString);
                  String formattedDate = DateFormat('dd-MM-yyyy').format(date);
                  IconData statusIcon;
                  Color statusColor;
                  String priorityText;
                  IconData priorityIcon;
                  Color priorityColor;
                  switch (task.priority) {
                    case 1:
                      priorityText = "Cao nhất";
                      priorityIcon = Icons.keyboard_double_arrow_up;
                      priorityColor = Colors.red;
                      break;
                    case 2:
                      priorityText = "Cao";
                      priorityIcon = Icons.keyboard_arrow_up;
                      priorityColor = Colors.deepOrangeAccent;
                      break;
                    case 3:
                      priorityText = "Trung bình";
                      priorityIcon = Icons.drag_handle;
                      priorityColor = Colors.orangeAccent;
                      break;
                    case 4:
                      priorityText = "Thấp";
                      priorityIcon = Icons.keyboard_arrow_down;
                      priorityColor = Colors.green;
                      break;
                    case 5:
                      priorityText = "Thấp nhất";
                      priorityIcon = Icons.keyboard_double_arrow_down;
                      priorityColor = Colors.lightBlue;
                      break;
                    default:
                      priorityText = "";
                      priorityIcon = Icons.graphic_eq;
                      priorityColor = Colors.grey;
                  }
                  switch (task.status) {
                    case 1:
                      statusIcon = Icons.insights;
                      statusColor = Colors.orange;
                      break;
                    case 2:
                      statusIcon = Icons.timelapse;
                      statusColor = Colors.amber;
                      break;
                    case 3:
                      statusIcon = Icons.schedule_send;
                      statusColor = Colors.blue;
                      break;
                    case 4:
                      statusIcon = Icons.assignment_turned_in;
                      statusColor = Colors.green;
                      break;
                    case 5:
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
                        case 6:
                          taskController.taskDetailApi(task.id);
                          Get.to(() => InventoryTask(taskId: task.id), arguments: task.id);
                          break;
                        default:
                          break;
                      }
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * .22,
                      width: double.infinity,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(25),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff0c4377),
                            Color(0xff114c81),
                            Color(0xff134777),
                            Color(0xff1960a1),
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
                            width: MediaQuery.of(context).size.width * .60,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * .04,
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
                                  height: MediaQuery.of(context).size.height * .08,
                                  child: Text(task.description.toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      )),
                                ),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
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
                                    child: Tooltip(
                                      message: priorityText,
                                      child: Icon(
                                        priorityIcon,
                                        color: priorityColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
