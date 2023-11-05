import 'package:FMS/data/response/status.dart';
import 'package:FMS/res/color/colors.dart';
import 'package:FMS/view_models/controller/qr/qr_room_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/components/general_exception.dart';
import '../../../res/components/internet_exception_widget.dart';
import '../../../res/routes/routes_name.dart';

class QRResultRoom extends StatelessWidget {
  final String id;
  QRResultRoom({super.key, required this.id});
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
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: MediaQuery.of(context).size.height * .30,
                    width: MediaQuery.of(context).size.width * .99,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
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
                          contentPadding: const EdgeInsets.all(0),
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
                          contentPadding: const EdgeInsets.all(0),
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
                          contentPadding: const EdgeInsets.all(0),
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
                      width: MediaQuery.of(context).size.width * .72,
                      height: 5,
                      decoration: BoxDecoration(
                        color: AppColor.grayColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  ListTile(
                    leading:
                    const Icon(Icons.list_alt, color: Colors.grey),
                    title: Text(
                      'Danh sách trang bị: (${qrController.assetInRoom.value.totalCount})',
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .50,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                      qrController.assetInRoom.value.data?.length ??
                          0,
                      itemBuilder: (BuildContext context, int index) {
                        final asset = assetInRoom?[index];
                        if (asset != null) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: ExpansionTile(
                              expandedAlignment: Alignment.topLeft,
                              backgroundColor: const Color(0xff0c4377),
                              collapsedBackgroundColor: Colors.grey,
                              leading: const Icon(Icons.compare_rounded,
                                  color: Colors.white),
                              title: Text('${asset.asset?.assetName}',
                                  style: const TextStyle(
                                      color: AppColor.whiteColor,
                                      fontSize: 18)),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20))),
                              collapsedShape:
                              const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20))),
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            child: Text(
                                                "Mã Thiết bị: ${asset.asset?.assetCode}",
                                                style: const TextStyle(
                                                    color: AppColor
                                                        .whiteColor,
                                                    fontSize: 18)),
                                          ),
                                          SizedBox(
                                            width: 300,
                                            child: Text(
                                                maxLines: 2,
                                                overflow:
                                                TextOverflow.ellipsis,
                                                "Trạng thái: ${asset.statusObj?.displayName}",
                                                style: const TextStyle(
                                                    color: AppColor
                                                        .whiteColor,
                                                    fontSize: 18)),
                                          ),
                                          SizedBox(
                                            child: Text(
                                                "Số lượng: ${asset.quantity}",
                                                style: const TextStyle(
                                                    color: AppColor
                                                        .whiteColor,
                                                    fontSize: 18)),
                                          ),
                                        ],
                                      ),
                                    )),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          );
                        } else {
                          return Container(
                            height: 300,
                            alignment: AlignmentDirectional.center,
                            child: const Text("Không Có Thiết Bị"),
                          );
                        }
                      },
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
