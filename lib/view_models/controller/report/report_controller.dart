import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:FMS/res/repository/report_repository/report_repository.dart';
import 'package:get/get.dart';
import '../../../data/response/status.dart';
import '../../../utlis/utlis.dart';
import '../task/task_controller.dart';

class ReportController extends GetxController {
  final taskController = Get.find<TaskController>();
  final _api = ReportRepository();
  final rxRequestStatus = StatusAPI.LOADING.obs;
  final descriptionController = TextEditingController().obs;
  RxString error = ''.obs;
  void setRexRequestStatus(StatusAPI _value) => rxRequestStatus.value = _value;
  void setError(String _value) => error.value = _value;
  List<Map<String, dynamic>> dataList = <Map<String, dynamic>>[].obs;

  void clearData() {
    dataList.clear();
  }

  void reportTask(String id, String description, List<String> image) async {
    Map data = {
      "file_name": "string",
      "raw_uri": "string",
      "uris": image,
      "file_type": 1,
      "content": description,
      "item_id": id,
      "status": 3,
      "is_verified": true,
      "rooms": [
        {
          "room_id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "assets": [
            {
              "asset_id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
              "quantity": 0,
              "status": 1
            }
          ]
        }
      ]
    };
    //print(data);
    _api.reportTask(data).then((value) {
      if (value['status_code'] == 200 || value['status_code'] == 201) {
        Get.back();
        taskController.refreshDetailApi(id);
        Timer(const Duration(seconds: 1), () {
          Utils.snackBarSuccess("Thông báo", "Báo cáo thành công");
        });
      } else {
        Utils.snackBarError("Thông báo", "Báo cáo không thành công");
      }
    }).onError((error, stackTrace) {
      Utils.snackBar('Có lỗi xảy ra: ', error.toString());
    });
  }

  void reportCheckTask(String id, String description, List<String> image,
      bool isVerified) async {
    Map data = {
      "file_name": "string",
      "raw_uri": "string",
      "uris": image,
      "file_type": 1,
      "content": description,
      "item_id": id,
      "status": 3,
      "is_verified": isVerified,
      "rooms": [
        {
          "room_id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "assets": [
            {
              "asset_id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
              "quantity": 0,
              "status": 1
            }
          ]
        }
      ]
    };

    _api.reportTask(data).then((value) {
      if (value['status_code'] == 200 || value['status_code'] == 201) {
        Get.back();
        taskController.refreshDetailApi(id);
        Timer(const Duration(seconds: 1), () {
          Utils.snackBarSuccess("Thông báo", "Báo cáo thành công");
        });
      } else {
        Utils.snackBarError("Thông báo", "Báo cáo không thành công");
      }
    }).onError((error, stackTrace) {
      Utils.snackBar('Có lỗi xảy ra: ', error.toString());
    });
  }

  void reportInventoryTask(String id, List<Map<String, dynamic>> rooms) async {
    Map data = {
      "file_name": "string",
      "raw_uri": "string",
      "uris": [
        "string"
      ],
      "file_type": 1,
      "content": "Đã Kiểm Kê",
      "item_id": id,
      "status": 3,
      "is_verified": true,
      "rooms": rooms
    };
    //print(jsonEncode(data));
    _api.reportTask(data).then((value) {
      if (value['status_code'] == 200 || value['status_code'] == 201) {
        Get.back();
        taskController.refreshDetailApi(id);
        Timer(const Duration(milliseconds: 300), () {
          Utils.snackBarSuccess("Thông báo", "Báo cáo thành công");
        });
      } else {
        Utils.snackBarError("Thông báo", "Báo cáo không thành công");
      }
    }).onError((error, stackTrace) {
      Utils.snackBar('Có lỗi xảy ra: ', error.toString());
    });
  }
}
