import 'package:FMS/res/routes/routes_name.dart';
import 'package:FMS/view/note/notes.dart';
import 'package:FMS/view/qr_code/qr_asset/qr_scan_asset.dart';
import 'package:FMS/view/statistics/statistics.dart';
import 'package:FMS/view/widget/list_notification.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:FMS/models/login/users_model.dart';
import 'package:FMS/view/widget/bottom_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:FMS/res/color/colors.dart';
import 'package:FMS/view_models/controller/user_prefrence/user_prefrence_view_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../view_models/controller/home/statistics_controller.dart';
import '../../view_models/controller/notification/notification_controller.dart';
import '../qr_code/qr_room/qr_scan_room.dart';
import '../widget/custom_card_info.dart';
import 'package:badges/badges.dart' as badges;

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final RxInt currentIndex = 0.obs;
  RxInt numNotRead = 0.obs;
  final notificationController = Get.put(NotificationController());
  final statisticsController = Get.put(StatisticsController());
  UserPreference userPreference = UserPreference();
  UsersModel? _user;
  @override
  void initState() {
    super.initState();
    _loadUserInfo();
    notificationController.notificationListApi();
    getCurrentNotification();
  }

  void getCurrentNotification() {
    int totalNotification =
        notificationController.notificationList.value.data?.length ?? 0;
    for (int i = 0; i < totalNotification; i++) {
      bool isReadNotification =
          notificationController.notificationList.value.data?[i].isRead ??
              false;
      if (!isReadNotification) {
        setState(() {
          numNotRead.value++;
        });
      }
    }
  }

  void _loadUserInfo() async {
    UserPreference userPreference = UserPreference();
    UsersModel user = await userPreference.getUserInfo();
    setState(() {
      _user = user;
    });
  }

  Future<void> handleLogout() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await userPreference.removeUser();
    FirebaseAuth.instance.signOut();
    googleSignIn.disconnect();
    googleSignIn.signOut();
    Get.toNamed(RouteName.loginScreen);
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Thông Báo'),
            content: const Text('Bạn muốn thoát ứng dụng'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: const Text('No'),
              ),
              ElevatedButton(
                onPressed: () {
                  handleLogout();
                },
                //return true when click on "Yes"
                child: const Text('Yes', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
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
              "FPT FMS",
              style: TextStyle(color: AppColor.whiteColor),
            ),
            actions: [
              Obx(
                () {
                  return Container(
                    margin: const EdgeInsets.only(right: 10, top: 5),
                    child: numNotRead.value == 0
                        ? IconButton(
                            onPressed: () => showDialog<void>(
                              context: context,
                              builder: (BuildContext context) => Dialog(
                                child: NotificationPopUp(notRead: numNotRead),
                              ),
                            ),
                            icon: const Icon(
                              Icons.add_alert,
                              color: AppColor.whiteColor,
                              size: 25,
                            ),
                          )
                        : Badge(
                            alignment: Alignment.topRight,
                            label: Text("${numNotRead.value}",
                                style: const TextStyle(fontSize: 8)),
                            child: IconButton(
                              onPressed: () => showDialog<void>(
                                context: context,
                                builder: (BuildContext context) => Dialog(
                                  child: NotificationPopUp(notRead: numNotRead),
                                ),
                              ),
                              icon: const Icon(
                                Icons.add_alert,
                                color: AppColor.whiteColor,
                                size: 25,
                              ),
                            ),
                          ),
                  );
                },
              )
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
                        height: 190,
                      ),
                      Positioned(
                        top: 25,
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
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300,
                                      color: AppColor.whiteColor,
                                    )),
                                 const Text("Chúc bạn có một ngày mới tốt lành.",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.whiteColor,
                                    )),
                              ],
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(RouteName.taskScreen);
                        },
                        borderRadius: BorderRadius.circular(15),
                        splashColor: Colors.grey.withOpacity(0.5),
                        child: Container(
                          width: 150,
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.primaryColor,
                              width: 2,
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
                                "Nhiệm Vụ",
                                style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.question,
                            headerAnimationLoop: true,
                            animType: AnimType.topSlide,
                            showCloseIcon: true,
                            closeIcon:
                                const Icon(Icons.close_fullscreen_outlined),
                            title: 'Quét Mã QR',
                            desc: 'Bạn muốn quét loại mã nào ? ',
                            btnCancelText: "QR Phòng",
                            btnCancelColor: Colors.blue,
                            btnCancelOnPress: () {
                              Get.to(() => const QRViewRoom());
                            },
                            onDismissCallback: (type) {
                              debugPrint('Dialog Dismiss from callback $type');
                            },
                            btnOkText: "QR Thiết Bị",
                            btnOkOnPress: () {
                              Get.to(() => const QRViewAsset());
                            },
                          ).show();
                        },
                        borderRadius: BorderRadius.circular(15),
                        splashColor: Colors.grey.withOpacity(0.5),
                        child: Container(
                          width: 150,
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.primaryColor,
                              width: 2,
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
                  const SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          statisticsController.getStatistics();
                          Get.to(() => const StatisticsPage());
                        },
                        borderRadius: BorderRadius.circular(15),
                        splashColor: Colors.grey.withOpacity(0.5),
                        child: Container(
                          width: 150,
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.primaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.equalizer,
                                  color: AppColor.primaryColor, size: 70),
                              SizedBox(width: 20),
                              Text("Thống Kê",
                                  style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 20,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const Note());
                        },
                        borderRadius: BorderRadius.circular(15),
                        splashColor: Colors.grey.withOpacity(0.5),
                        child: Container(
                          width: 150,
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.primaryColor,
                              width: 2,
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomBar(currentIndex),
        ),
      ),
    );
  }
}