import 'package:FMS/view/statistics/widget/replace_chart.dart';
import 'package:flutter/material.dart';
import '../../res/color/colors.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    //refreshData();
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: AppColor.whiteColor,
                    size: 25,
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const ListTile(
                      leading: Icon(Icons.engineering),
                      title: Text("Nhiệm vụ bảo trì",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey)),
                    ),
                  ),
                  const ReplaceChart(),
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
                      title: Text("Nhiệm vụ thay thế",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey)),
                    ),
                  ),
                  const ReplaceChart(),
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
                      title: Text("Nhiệm vụ sửa chữa",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey)),
                    ),
                  ),
                  const ReplaceChart(),
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
                      title: Text("Nhiệm vụ điều chuyển",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey)),
                    ),
                  ),
                  const ReplaceChart(),
                  const SizedBox(height: 20)
                ],
              ),
            )));
  }
}
