import 'package:FMS/res/routes/routes_name.dart';
import 'package:FMS/view/widget/list_notification.dart';
import 'package:flutter/material.dart';
import 'package:FMS/models/login/users_model.dart';
import 'package:FMS/view/widget/bottom_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:FMS/res/color/colors.dart';
import 'package:FMS/view_models/controller/user_prefrence/user_prefrence_view_model.dart';
import '../../view_models/controller/notification/notification_controller.dart';
import '../qr_code/qr_scan_code.dart';
import '../widget/custom_card_info.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final RxInt currentIndex = 0.obs;
  final notificationController = Get.put(NotificationController());
  UserPreference userPreference = UserPreference();
  UsersModel? _user;
  @override
  void initState() {
    super.initState();
    _loadUserInfo();
    notificationController.notificationListApi();
    //homeController.userListApi();
  }

  void _loadUserInfo() async {
    UserPreference userPreference = UserPreference();
    UsersModel user = await userPreference.getUserInfo();
    setState(() {
      _user = user;
    });
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
            )),
          ),
          title: const Text(
            "FPT FMS",
            style: TextStyle(color: AppColor.primaryColor),
          ),
          actions: [
            IconButton(
                onPressed: () => showDialog<void>(
                      context: context,
                      builder: (BuildContext context) => Dialog(
                        child: NotificationPopUp(),
                      ),
                    ),
                icon: const Icon(
                  Icons.add_alert,
                  color: AppColor.primaryColor,
                  size: 25,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: [
                    const BackgroundWave(
                      height: 200,
                    ),
                    Positioned(
                      top: 32,
                      left: 16,
                      right: 16,
                      child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.all(10),
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Xin Chào, ${_user != null ? _user?.data?.fullname ?? "" : ""}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    color: AppColor.primaryColor,
                                  )),
                              const Text("Bạn có n nhiệm vụ cần xử lý",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.primaryColor,
                                  )),
                            ],
                          )),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Row(
                    children: <Widget>[
                      Icon(Icons.search),
                      SizedBox(width: 5),
                      Text("Search something..."),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteName.taskScreen);
                      },
                      child: Container(
                        width: 150,
                        height: 200,
                        decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          border: Border.all(
                            color: AppColor.primaryColor,
                            width: 4,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.task_rounded,
                                color: AppColor.primaryColor, size: 70),
                            SizedBox(width: 10),
                            Text(
                              "Công Việc",
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(const QRViewExample());
                      },
                      child: Container(
                        width: 150,
                        height: 200,
                        decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          border: Border.all(
                            color: AppColor.primaryColor,
                            width: 4,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.qr_code_scanner,
                                color: AppColor.primaryColor, size: 70),
                            SizedBox(width: 10),
                            Text(
                              "Quét QR",
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 150,
                      height: 200,
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        border: Border.all(
                          color: AppColor.primaryColor,
                          width: 4,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.search,
                              color: AppColor.primaryColor, size: 70),
                          SizedBox(width: 10),
                          Text("Nhiệm Vụ",
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 20,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 200,
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        border: Border.all(
                          color: AppColor.primaryColor,
                          width: 4,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.summarize,
                              color: AppColor.primaryColor, size: 70),
                          SizedBox(width: 10),
                          Text("Ghi Chú",
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 20,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomBar(currentIndex),
      ),
    );
  }
}
