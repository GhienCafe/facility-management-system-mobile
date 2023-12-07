import 'package:FMS/data/response/status.dart';
import 'package:FMS/res/color/colors.dart';
import 'package:FMS/view_models/controller/notification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../res/components/general_exception.dart';
import '../../res/components/internet_exception_widget.dart';
import '../../view_models/controller/task/task_controller.dart';
import 'loading_noti_list.dart';

class NotificationPopUp extends StatelessWidget {
  final RxInt notRead;
  NotificationPopUp({super.key, required this.notRead});
  final notificationController = Get.find<NotificationController>();
  final taskController = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      BackButton(color: AppColor.primaryColor),
                      Text("Thông Báo",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      notRead.value = 0;
                      notificationController.readAllNotification();
                    },
                    icon: const Icon(Icons.checklist),
                    tooltip: "Đọc Hết"
                  )
                ],
              ),
            ],
          ),
          Obx(() {
            switch (notificationController.rxRequestStatus.value) {
              case StatusAPI.LOADING:
                return const SizedBox(
                  height: 510,
                  child: LoadingListNotification(),
                );
              case StatusAPI.COMPLETED:
                return SizedBox(
                  height: 500,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: notificationController
                            .notificationList.value.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      final notification = notificationController
                          .notificationList.value.data![index];
                      String? jsonDateString = notification.createdAt;
                      DateTime date = DateTime.parse(jsonDateString!);
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(date);
                      return GestureDetector(
                        onTap: () {
                          if (!notification.isRead!) {
                            if(notRead.value > 0){
                              notRead.value--;
                            }
                            notificationController.readNotification(
                                notification.id ??
                                    "00000000-0000-0000-0000-000000000000");

                          }
                          taskController.getDetailFromNotification(notification.itemId);
                        },
                        child: Container(
                          height: 120,
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: notification.isRead!
                                ? const Color(0xA6625F5F)
                                : AppColor.orangeColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 180,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${notification.title}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: AppColor.whiteColor)),
                                    Text("${notification.content}",
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: AppColor.whiteColor),
                                        maxLines: 2),
                                  ],
                                ),
                              ),
                              const VerticalDivider(
                                  thickness: 1, color: AppColor.whiteColor),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(formattedDate,
                                      style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.whiteColor)),
                                  const SizedBox(height: 20),
                                  if (!notification.isRead!)
                                    const Icon(Icons.notification_important,
                                        color: AppColor.whiteColor),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              case StatusAPI.ERROR:
                if (notificationController.error.value == 'No internet') {
                  return InternetExceptionWidget(
                    onPress: () {
                      notificationController.refreshApi();
                    },
                  );
                } else {
                  return GeneralExceptionWidget(onPress: () {
                    notificationController.refreshApi();
                  }); // Return the Text widget
                }
            }
          })
        ],
      ),
    );
  }
}
