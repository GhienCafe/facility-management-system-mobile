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

  void reportTask(String id, String description, List<String> image)  async {
    Map data={
      "file_name": "string",
      "key": "string",
      "raw_uri": "string",
      "uris": image,
      "extensions": "string",
      "file_type": 1,
      "content": description,
      "item_id": id
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

}
