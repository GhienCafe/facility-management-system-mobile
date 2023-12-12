import 'package:FMS/utlis/utlis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/task/assets_in_room_model.dart';
import '../../res/color/colors.dart';
import '../../view_models/controller/report/report_controller.dart';
import '../../view_models/controller/task/task_controller.dart';
import '../qr_code/qr_scan_code.dart';

class ReportInventory extends StatefulWidget {
  final Rooms room;
  const ReportInventory({Key? key, required this.room}) : super(key: key);

  @override
  _ReportInventoryState createState() => _ReportInventoryState();
}

class _ReportInventoryState extends State<ReportInventory> {
  late List<Map<String, dynamic>> assetList;
  final reportController = Get.find<ReportController>();
  final taskController = Get.find<TaskController>();

  static List<Map<String, dynamic>> rooms = [];
  @override
  void initState() {
    super.initState();
    assetList = List.generate(
        widget.room.assets?.length ?? 0,
        (index) => {
              'asset_id': widget.room.assets?[index].id,
              'quantity': widget.room.assets?[index].quantityBefore,
              'status': widget.room.assets?[index].statusBefore
            });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final taskInfo = taskController.taskDetail.value.data;
    bool isActionButtonVisible = taskInfo?.status == 2;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Get.back();
            },
          ),
          title: const Text(
            'Chi Tiết',
            style: TextStyle(
              color: AppColor.whiteColor,
              letterSpacing: 1,
            ),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff0e4e86),
                  Color(0xff1461a2),
                  Color(0xff2e7abb),
                ],
              ),
            ),
          ),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const Padding(
                padding: EdgeInsets.only(left: 15, bottom: 12, top: 20),
                child: Text(
                  "Danh Sách Thiết Bị Cần Kiểm Tra:",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: h* 0.8,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: widget.room.assets?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    final asset = widget.room.assets?[index];
                    if (asset != null) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: ExpansionTile(
                          collapsedShape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          collapsedBackgroundColor: Colors.grey,
                          collapsedIconColor: Colors.white,
                          collapsedTextColor: Colors.white,
                          trailing: const Icon(Icons.info),
                          title: Text('${asset.assetName}',
                              style: const TextStyle(fontSize: 18)),
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .65,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 15),
                                  child: Column(children: [
                                    TextFormField(
                                      decoration: InputDecoration(
                                        labelText:
                                        'Số lượng: (Hiện tại: ${asset.quantityBefore})',
                                        hintText:
                                        'Nhập số lượng thiết bị hiện tại',
                                      ),
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        setState(() {
                                          assetList[index]['quantity'] =
                                              int.tryParse(value) ?? 0;
                                        });
                                      },
                                    ),
                                    DropdownButtonFormField<int>(
                                      decoration: const InputDecoration(
                                          labelText: 'Trạng Thái'),
                                      value: assetList[index]['status'] as int,
                                      items: const [
                                        DropdownMenuItem<int>(
                                          value: 1,
                                          child: Text('Hoạt động bình thường'),
                                        ),
                                        DropdownMenuItem<int>(
                                          value: 2,
                                          child: Text('Không thể sử dụng'),
                                        ),
                                        DropdownMenuItem<int>(
                                          value: 8,
                                          child: Text('Hư hại'),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          assetList[index]['status'] = value;
                                        });
                                      },
                                    ),
                                  ]),
                                ),
                                const VerticalDivider(
                                    thickness: 10,
                                    color: AppColor.whiteColor,
                                    width: 2),
                                IconButton(
                                  tooltip: "Scan QR Thiết Bị",
                                  icon: const Icon(Icons.qr_code_scanner_outlined,
                                      size: 60, color: AppColor.blackColor),
                                  onPressed: () {
                                    Get.to(() => QRViewExample(
                                        taskInfoId: asset.id ??
                                            "00000000-0000-0000-0000-000000000000"));
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              )
            ],
          ),
        floatingActionButton: Visibility(
          visible: isActionButtonVisible,
          child: FloatingActionButton.extended(
            onPressed: () {
              saveToRoomsList();
              Get.back();
              Utils.snackBar("Thông báo:", "Cập nhật thành công");
            },
            backgroundColor: Colors.blue,
            label: const Text('Cập Nhật', style: TextStyle(color: Colors.white)),
            icon: const Icon(Icons.save_as_outlined, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> getJsonMap() {
    return {
      'room_id': widget.room.id,
      'assets': List<Map<String, dynamic>>.from(assetList),
    };
  }

  void saveToRoomsList() {
    Map<String, dynamic> jsonMap = getJsonMap();
    int existingIndex = rooms.indexWhere((element) {
      Map<String, dynamic> existingMap = element;
      return existingMap['room_id'] == widget.room.id;
    });
    if (existingIndex != -1) {
      rooms[existingIndex] = jsonMap;
    } else {
      rooms.add(jsonMap);
    }
    reportController.dataList = rooms;
  }
}
