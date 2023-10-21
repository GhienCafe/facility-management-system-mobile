import 'dart:async';

import 'package:FMS/models/task/check_task_model.dart';
import 'package:FMS/res/repository/task_repository/task_repository.dart';
import 'package:get/get.dart';
import '../../../data/response/status.dart';
import '../../../models/task/tasks_list_model.dart';
import '../../../utlis/utlis.dart';

class TaskController extends GetxController {
  var isLoading = true.obs;
  RxBool isExpanded = false.obs;
  final _api = TaskRepository();
  final rxRequestStatus = StatusAPI.LOADING.obs;
  final rxRequestWaitingStatus = StatusAPI.LOADING.obs;
  final rxRequestProcessStatus = StatusAPI.LOADING.obs;
  final rxRequestDetailStatus = StatusAPI.LOADING.obs;
  final rxRequestCompleteStatus = StatusAPI.LOADING.obs;

  final taskList = TaskListModel().obs;
  final taskListWaiting = TaskListModel().obs;
  final taskListProcess = TaskListModel().obs;
  final taskListSuccess = TaskListModel().obs;
  final taskDetail = TaskDetailModel().obs;

  RxString error = ''.obs;
  RxInt selectedIndex = 0.obs;

  void setRexRequestStatus(StatusAPI value) => rxRequestStatus.value = value;
  void setRexRequestWaitingStatus(StatusAPI value) => rxRequestWaitingStatus.value = value;
  void setRexRequestProcessStatus(StatusAPI value) => rxRequestProcessStatus.value = value;
  void setRexRequestCompleteStatus(StatusAPI value) => rxRequestCompleteStatus.value = value;
  void setRexRequestDetailStatus(StatusAPI value) => rxRequestDetailStatus.value = value;

  void setTaskList(TaskListModel value) => taskList.value = value;
  void setTaskWaitingList(TaskListModel value) => taskListWaiting.value = value;
  void setTaskProcessList(TaskListModel value) => taskListProcess.value = value;
  void setTaskCompleteList(TaskListModel value) => taskListSuccess.value = value;
  void setTaskDetail(TaskDetailModel value) => taskDetail.value = value;
  void setError(String value) => error.value = value;

  void taskListApi() {
    _api
        .taskListApi()
        .then((value) => {
              setRexRequestStatus(StatusAPI.COMPLETED),
              setTaskList(value),
            })
        .onError((error, stackTrace) => {
              setError(error.toString()),
              setRexRequestStatus(StatusAPI.ERROR),
            });
  }

  void taskListProcessApi() {
    _api
        .taskListProcessApi()
        .then((value) => {
      setRexRequestProcessStatus(StatusAPI.COMPLETED),
      setTaskProcessList(value),
    })
        .onError((error, stackTrace) => {
      setError(error.toString()),
      setRexRequestProcessStatus(StatusAPI.ERROR),
    });
  }

  void taskListCompleteApi() {
    _api
        .taskListCompleteApi()
        .then((value) => {
      setRexRequestCompleteStatus(StatusAPI.COMPLETED),
      setTaskCompleteList(value),
    })
        .onError((error, stackTrace) => {
      setError(error.toString()),
      setRexRequestCompleteStatus(StatusAPI.ERROR),
    });
  }

  void taskListWaitingApi() {
    _api
        .taskListWaitingApi()
        .then((value) => {
      setRexRequestWaitingStatus(StatusAPI.COMPLETED),
      setTaskWaitingList(value),
    })
        .onError((error, stackTrace) => {
      setError(error.toString()),
      setRexRequestWaitingStatus(StatusAPI.ERROR),
    });
  }

  void taskDetailApi(String? id) {
    rxRequestDetailStatus(StatusAPI.LOADING);
    final taskClean = TaskDetailModel();
    setTaskDetail(taskClean);
    _api
        .taskDetailApi(id!)
        .then((value) => {
              setTaskDetail(value),
              rxRequestDetailStatus(StatusAPI.COMPLETED),
            })
        .onError((error, stackTrace) => {
              setError(error.toString()),
              rxRequestDetailStatus(StatusAPI.ERROR),
            });
  }

  void acceptTask(String id) async {
    Map data = {
      "file_name": "string",
      "key": "string",
      "raw_uri": "string",
      "uris": ["string"],
      "extensions": "string",
      "file_type": 1,
      "content": "string",
      "item_id": id
    };
    _api.acceptTask(data).then((value) {
      if (value['status_code'] == 200 || value['status_code'] == 201) {
        refreshDetailApi(id);
        Timer(const Duration(seconds: 1), () {
          Utils.snackBarSuccess("Thông báo", "Xác nhận nhiệm vụ thành công");
        });
      } else {
        Utils.snackBarError("Thông báo", "Xác nhận nhiệm vụ không thành công");
      }
    }).onError((error, stackTrace) {
      Utils.snackBar('Có lỗi xảy ra: ', error.toString());
    });
  }

  void refreshApi() {
    setRexRequestStatus(StatusAPI.LOADING);
    _api
        .taskListApi()
        .then((value) => {
              setRexRequestStatus(StatusAPI.COMPLETED),
              setTaskList(value),
            })
        .onError((error, stackTrace) => {
              setError(error.toString()),
              setRexRequestStatus(StatusAPI.ERROR),
            });
  }

  void refreshDetailApi(String id) {
    setRexRequestDetailStatus(StatusAPI.LOADING);
    _api
        .taskDetailApi(id)
        .then((value) => {
              setRexRequestDetailStatus(StatusAPI.COMPLETED),
              setTaskDetail(value),
            })
        .onError((error, stackTrace) => {
              setError(error.toString()),
              setRexRequestDetailStatus(StatusAPI.ERROR),
            });
  }
}
