import 'package:FMS/data/response/status.dart';
import 'package:FMS/res/color/colors.dart';
import 'package:FMS/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../res/components/general_exception.dart';
import '../../../res/components/internet_exception_widget.dart';
import '../../../view_models/controller/qr/qr_controller.dart';

class QRResultAsset extends StatelessWidget {
  final String id;
  QRResultAsset({super.key, required this.id});

  final qrController = Get.find<QRController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              "Thông Tin Thiết Bị",
              style: TextStyle(
                color: AppColor.whiteColor,
                letterSpacing: 1,
              ),
            ),
          ),
          body: Obx(() {
            switch (qrController.rxRequestStatus.value) {
              case StatusAPI.LOADING:
                return const CircularProgressIndicator();
              case StatusAPI.COMPLETED:
                final assetInfo = qrController.asset.value.data;
                String? jsonDateString = assetInfo?.lastCheckedDate;
                String nonNullableString =
                    jsonDateString ?? "0000-00-00T08:53:33.0000694";
                DateTime date = DateTime.parse(nonNullableString);
                String formattedDate = DateFormat('dd-MM-yyyy').format(date);
                return Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .30,
                      width: MediaQuery.of(context).size.width * .90,
                      child: Image.network(
                        assetInfo?.imageUrl?.isNotEmpty == true
                            ? assetInfo!.imageUrl!
                            : "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png",
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 40, right: 14, left: 14),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Thông Tin Thiết Bị',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${assetInfo?.assetName}',
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "${assetInfo?.assetCode}",
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  ListTile(
                                    leading: const Icon(Icons.info),
                                    title: const Text("Loại thiết bị:",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400)),
                                    subtitle: Text(
                                        "${assetInfo?.category?.categoryName}"),
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.info),
                                    title:  Text("Năm Sản Xuất: ${assetInfo?.manufacturingYear}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.info),
                                    title: Text("Lần cuối sửa chữa: $formattedDate",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.info),
                                    title: Text("Trạng thái: ${assetInfo?.statusObj?.displayName}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
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
                        ],
                      ),
                    ),
                  ],
                );
              case StatusAPI.ERROR:
                if (qrController.error.value == 'No internet') {
                  return InternetExceptionWidget(
                    onPress: () {
                      qrController.refreshApi(id);
                    },
                  );
                } else {
                  return GeneralExceptionWidget(onPress: () {
                    qrController.refreshApi(id);
                  });
                }
            }
          })),
    );
  }
}
