import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../data/response/status.dart';
import '../../../models/task/check_task_model.dart';
import '../../../res/color/colors.dart';
import '../../../res/components/general_exception.dart';
import '../../../res/components/internet_exception_widget.dart';
import '../../../res/routes/routes_name.dart';
import '../../../view_models/controller/task/task_controller.dart';
import '../../widget/loading_task_detail.dart';

class RepairTask extends StatelessWidget {
  final String? taskId;
  final taskController = Get.find<TaskController>();
  RepairTask({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: AppColor.primaryColor,
            onPressed: () {
              //Get.back();
              taskController.setTaskDetail(TaskDetailModel());
              Get.toNamed(RouteName.taskScreen);
            },
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFACCCC), Color(0xFFF6EFE9)],
                )),
          ),
          title: const Text(
            "Chi tiết nhiệm vụ",
            style: TextStyle(
              color: AppColor.primaryColor,
              letterSpacing: 1,
            ),
          ),
        ),
        body: Obx(() {
          switch (taskController.rxRequestDetailStatus.value) {
            case StatusAPI.LOADING:
              return const LoadingTaskPage();
            case StatusAPI.COMPLETED:
              final taskInfo = taskController.taskDetail.value.data;
              String? jsonDateString = taskInfo?.requestDate;
              String nonNullableString = jsonDateString ?? "2023-09-19T08:53:33.0000694";
              DateTime date = DateTime.parse(nonNullableString);
              String formattedDate = DateFormat('dd-MM-yyyy').format(date);
              IconData statusIcon;
              Color statusColor;
              switch (taskInfo?.status) {
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
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      width: 500,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [Color(0xFFE78956), Color(0xFFE8924B)],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 80,
                            child: ListTile(
                              title: Text(
                                "${taskInfo?.typeObj?.displayName}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: Text(
                                "${taskInfo?.description}",
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              leading: const Icon(Icons.add_chart_outlined,
                                  size: 30, color: Colors.white),
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 30,
                                width: 175,
                                child: ListTile(
                                  leading: const Icon(Icons.room,
                                      color: Colors.white,
                                      size:
                                      25),
                                  title: Text(
                                    'Phòng ${taskInfo?.currentRoom?.roomCode}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors
                                          .white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                width: 185,
                                child: ListTile(
                                  leading: const Icon(Icons.event,
                                      color: Colors.white,
                                      size:
                                      25),
                                  title: Text(
                                    formattedDate,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors
                                          .white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 15, bottom: 15),
                            height: 30,
                            child: ListTile(
                              leading: Container(
                                width: 25,
                                height: 25,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                    color: Colors.white),
                                child: Icon(statusIcon,
                                    color: statusColor, size: 20),
                              ),
                              title: Text(
                                'Trạng thái: ${taskInfo?.statusObj?.displayName}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color:
                                  Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: ListTile(
                              leading: const Icon(Icons.key_rounded,
                                  color: Colors.white,
                                  size:
                                  25),
                              title: Text(
                                "Mã: ${taskInfo?.requestCode}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color:
                                  Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text("Thông Tin Thiết Bị:",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ),
                    Accordion(
                      paddingListTop: 0,
                      paddingListBottom: 0,
                      maxOpenSections: 1,
                      headerBackgroundColorOpened: Colors.black54,
                      headerPadding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 15),
                      children: [
                        AccordionSection(
                          isOpen: false,
                          leftIcon: const Icon(Icons.compare_rounded,
                              color: Colors.white),
                          header: Text('${taskInfo?.asset?.assetCode}',
                              style: const TextStyle(
                                  color: AppColor.blackColor)),
                          headerBackgroundColor: Colors.black38,
                          headerBackgroundColorOpened: Color(0xFFE78956),
                          contentBorderColor: Colors.black54,
                          content: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0,
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: const Icon(Icons.info,
                                        color: AppColor.blackColor),
                                    title: Text(
                                        "${taskInfo?.asset?.description}",
                                        style: const TextStyle(
                                            color: AppColor.blackColor)),
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.info,
                                        color: AppColor.blackColor),
                                    title: Text(
                                        "${taskInfo?.asset?.statusObj?.displayName}",
                                        style: const TextStyle(
                                            color: AppColor.blackColor)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
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
        }),
      ),
    );
  }
}
