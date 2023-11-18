import 'package:FMS/data/response/status.dart';
import 'package:FMS/view/statistics/widget/replace_chart.dart';
import 'package:flutter/material.dart';
import '../../res/color/colors.dart';
import '../../res/components/general_exception.dart';
import '../../res/components/internet_exception_widget.dart';
import '../../view_models/controller/home/statistics_controller.dart';
import 'package:get/get.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final StatisticsController statisticsController =
        Get.put(StatisticsController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: AppColor.whiteColor),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xff0e4e86),
                Color(0xff1461a2),
                Color(0xff2e7abb),
              ],
            )),
          ),
          title: const Text(
            "Thống Kê",
            style: TextStyle(color: AppColor.whiteColor),
          ),
          actions: [
            IconButton(
              onPressed: () {
                statisticsController.refreshStatisticsInfoApi();
              },
              icon: const Icon(
                Icons.refresh,
                color: AppColor.whiteColor,
                size: 25,
              ),
            )
          ],
        ),
        body: Obx(
          () {
            switch (statisticsController.rxRequestStatus.value) {
              case StatusAPI.LOADING:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case StatusAPI.COMPLETED:
                final statistic = statisticsController.statistic.value.data;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const ListTile(
                          leading: Icon(Icons.engineering),
                          title: Text("Nhiệm Vụ Kiểm Tra",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey)),
                        ),
                      ),
                      ReplaceChart(
                          total: statistic?.assetCheckTask?.total ?? 1,
                          process: statistic?.assetCheckTask?.process ?? 0,
                          waiting: statistic?.assetCheckTask?.waiting ?? 0,
                          complete: statistic?.assetCheckTask?.complete ?? 0,
                          reported: statistic?.assetCheckTask?.reported ?? 0),
                      const Divider(
                        thickness: 2,
                        color: Colors.grey,
                        indent: 30,
                        endIndent: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const ListTile(
                          leading: Icon(Icons.handyman),
                          title: Text("Nhiệm Vụ Sửa Chữa",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey)),
                        ),
                      ),
                      ReplaceChart(
                          total: statistic?.repairTask?.total ?? 1,
                          process: statistic?.repairTask?.process ?? 0,
                          waiting: statistic?.repairTask?.waiting ?? 0,
                          complete: statistic?.repairTask?.complete ?? 0,
                          reported: statistic?.repairTask?.reported ?? 0
                      ),
                      const Divider(
                        thickness: 2,
                        color: Colors.grey,
                        indent: 30,
                        endIndent: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const ListTile(
                          leading: Icon(Icons.swap_horizontal_circle),
                          title: Text("Nhiệm Vụ Thay Thế",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey)),
                        ),
                      ),
                      ReplaceChart(
                          total: statistic?.replaceTask?.total ?? 1,
                          process: statistic?.replaceTask?.process ?? 0,
                          waiting: statistic?.replaceTask?.waiting ?? 0,
                          complete: statistic?.replaceTask?.complete ?? 0,
                          reported: statistic?.replaceTask?.reported ?? 0
                      ),
                      const Divider(
                        thickness: 2,
                        color: Colors.grey,
                        indent: 30,
                        endIndent: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const ListTile(
                          leading: Icon(Icons.conveyor_belt),
                          title: Text("Nhiệm Vụ Kiểm Kê",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey)),
                        ),
                      ),
                      ReplaceChart(
                          total: statistic?.inventoryCheckTask?.total ?? 1,
                          process: statistic?.inventoryCheckTask?.process ?? 0,
                          waiting: statistic?.inventoryCheckTask?.waiting ?? 0,
                          complete: statistic?.inventoryCheckTask?.complete ?? 0,
                          reported: statistic?.inventoryCheckTask?.reported ?? 0
                      ),
                      const SizedBox(height: 20)
                    ],
                  ),
                );
              case StatusAPI.ERROR:
                if (statisticsController.error.value == 'No internet') {
                  return InternetExceptionWidget(
                    onPress: () {
                      statisticsController.refreshStatisticsInfoApi();
                    },
                  );
                } else {
                  return GeneralExceptionWidget(onPress: () {
                    statisticsController.refreshStatisticsInfoApi();
                  });
                }
            }
          },
        ),
      ),
    );
  }
}
