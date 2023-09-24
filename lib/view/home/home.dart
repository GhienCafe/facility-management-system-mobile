import 'package:FMS/res/routes/routes_name.dart';
import 'package:FMS/view/widget/list_notification.dart';
import 'package:flutter/material.dart';
import 'package:FMS/models/login/users_model.dart';
import 'package:FMS/view/widget/bottom_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:FMS/res/color/colors.dart';
import 'package:FMS/view_models/controller/user_prefrence/user_prefrence_view_model.dart';
import '../../view_models/controller/home/home_controller.dart';
import '../qr_code/qr_scan_code.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final RxInt currentIndex = 0.obs;
  final homeController = Get.put(HomeController());
  UserPreference userPreference = UserPreference();
  UsersModel? _user;
  @override
  void initState() {
    super.initState();
    _loadUserInfo();
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
          backgroundColor: AppColor.whiteColor,
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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(
                        "Xin Chào, ${_user != null ? _user?.data?.fullname ?? "" : ""}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: MyColorsSample.grey_5,
                        )),
                    const Text("Bạn có n nhiệm vụ cần xử lý",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: AppColor.whiteColor,
                        )),
                  ],)
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
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
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.task_rounded, color: AppColor.whiteColor, size: 70),
                            SizedBox(width: 10),
                            Text(
                              "Công Việc",
                              style: TextStyle(
                                color: AppColor.whiteColor,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Get.to(const QRViewExample());
                      },
                      child: Container(
                        width: 150,
                        height: 200,
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.camera_alt_sharp, color: AppColor.whiteColor, size: 70),
                            SizedBox(width: 10),
                            Text(
                              "Scan QR",
                              style: TextStyle(
                                color: AppColor.whiteColor,
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
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.search,
                              color: AppColor.whiteColor, size: 70),
                          SizedBox(width: 10),
                          Text("Nhiệm Vụ",
                              style: TextStyle(
                                color: AppColor.whiteColor,
                                fontSize: 20,
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 150,
                      height: 200,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.search,
                              color: AppColor.whiteColor, size: 70),
                          SizedBox(width: 10),
                          Text("Nhiệm Vụ",
                              style: TextStyle(
                                color: AppColor.whiteColor,
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


