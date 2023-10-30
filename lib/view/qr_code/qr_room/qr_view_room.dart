import 'package:FMS/data/response/status.dart';
import 'package:FMS/res/color/colors.dart';
import 'package:FMS/view_models/controller/qr/qr_room_controller.dart';
import 'package:accordion/accordion.dart';
import 'package:accordion/accordion_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/components/general_exception.dart';
import '../../../res/components/internet_exception_widget.dart';
import '../../../res/routes/routes_name.dart';

class QRResultRoom extends StatelessWidget {
  final String id;
  QRResultRoom({required this.id});
  final qrController = Get.find<QRRoomController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
              color: AppColor.whiteColor,
              onPressed: () {
                Get.toNamed(RouteName.homeScreen);
              }),
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
            "Thông Tin Phòng",
            style: TextStyle(
              color: AppColor.whiteColor,
              letterSpacing: 1,
            ),
          ),
        ),
        body: Obx(() {
          switch (qrController.rxRequestRoomStatus.value) {
            case StatusAPI.LOADING:
              return const CircularProgressIndicator();
            case StatusAPI.COMPLETED:
              final roomInfo = qrController.room.value.data;
              final assetInRoom = qrController.assetInRoom.value.data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 680,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: MediaQuery.of(context).size.height * .30,
                            width: MediaQuery.of(context).size.width * .99,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  leading: const Icon(Icons.info),
                                  title: Text(
                                    'Số Phòng: ${roomInfo?.roomCode}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  leading: const Icon(Icons.info),
                                  title: Text(
                                    'Diện tích: ${roomInfo?.area}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  leading: const Icon(Icons.info),
                                  title: Text(
                                    'Mô tả: ${roomInfo?.roomType?.typeName}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  leading: const Icon(Icons.info),
                                  title: Text(
                                    'Trạng thái: ${roomInfo?.status?.statusName}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              margin: const EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width * .72,
                              height: 5,
                              decoration: BoxDecoration(
                                color: AppColor.grayColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.list_alt, color: Colors.grey),
                            title: Text(
                              'Danh sách trang bị: (${qrController.assetInRoom.value.totalCount})',
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: qrController.assetInRoom.value.data?.length ?? 0,
                              itemBuilder: (BuildContext context, int index) {
                                final asset = assetInRoom?[index];
                                if (asset != null) {
                                  return Accordion(
                                    paddingListTop: 0,
                                    paddingListBottom: 0,
                                    maxOpenSections: 1,
                                    headerBackgroundColorOpened: Colors.black54,
                                    headerPadding:
                                    const EdgeInsets.symmetric(
                                        vertical: 7, horizontal: 15),
                                    children: [
                                      AccordionSection(
                                        isOpen: false,
                                        leftIcon: const Icon(Icons.info,
                                            color: Colors.white),
                                        header: Text(
                                            '${asset.asset?.assetName}',
                                            style: const TextStyle(
                                                color:
                                                AppColor.whiteColor,
                                                fontSize: 18)),
                                        headerBackgroundColor:
                                        Colors.black38,
                                        headerBackgroundColorOpened:
                                        const Color(0xff1960a1),
                                        contentBorderColor:
                                        Colors.black54,
                                        content: Align(
                                            alignment:
                                            Alignment.centerLeft,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    SizedBox(
                                                      height: 30,
                                                      child: Text(
                                                          "Mã Thiết bị: ${asset.asset?.assetCode}",
                                                          style: const TextStyle(
                                                              color: AppColor
                                                                  .blackColor,
                                                              fontSize:
                                                              18)),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                      child: Text(
                                                          "Trạng thái: ${asset.asset?.statusObj?.displayName}",
                                                          style: const TextStyle(
                                                              color: AppColor
                                                                  .blackColor,
                                                              fontSize:
                                                              18)),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                      child: Text(
                                                          "Số lượng: ${asset.asset?.quantity}",
                                                          style: const TextStyle(
                                                              color: AppColor
                                                                  .blackColor,
                                                              fontSize:
                                                              18)),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                      ),
                                    ],
                                  );
                                } else {
                                  return Container(
                                    height: 300,
                                    alignment:
                                    AlignmentDirectional.center,
                                    child:
                                    const Text("Không Có Thiết Bị"),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            case StatusAPI.ERROR:
              if (qrController.error.value == 'No internet') {
                return InternetExceptionWidget(
                  onPress: () {
                    //qrController.refresh();
                  },
                );
              } else {
                return GeneralExceptionWidget(onPress: () {
                  //qrController.refreshApi(id);
                });
              }
          }
        }));
  }
}
