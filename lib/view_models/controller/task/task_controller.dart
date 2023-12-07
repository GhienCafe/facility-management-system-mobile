import 'dart:async';

import 'package:FMS/models/task/check_task_model.dart';
import 'package:FMS/res/repository/task_repository/task_repository.dart';
import 'package:FMS/view/task/task_detail/repair_task.dart';
import 'package:FMS/view/task/task_detail/replace_task.dart';
import 'package:get/get.dart';
import '../../../data/response/status.dart';
import '../../../models/task/tasks_list_model.dart';
import '../../../utlis/utlis.dart';
import '../../../view/task/task_detail/check_task.dart';
import '../../../view/task/task_detail/inventory_task.dart';
import '../../../view/task/task_detail/maintain_task.dart';
import '../../../view/task/task_detail/transfer_task.dart';

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
  void setRexRequestWaitingStatus(StatusAPI value) =>
      rxRequestWaitingStatus.value = value;
  void setRexRequestProcessStatus(StatusAPI value) =>
      rxRequestProcessStatus.value = value;
  void setRexRequestCompleteStatus(StatusAPI value) =>
      rxRequestCompleteStatus.value = value;
  void setRexRequestDetailStatus(StatusAPI value) =>
      rxRequestDetailStatus.value = value;

  void setTaskList(TaskListModel value) => taskList.value = value;
  void setTaskWaitingList(TaskListModel value) => taskListWaiting.value = value;
  void setTaskProcessList(TaskListModel value) => taskListProcess.value = value;
  void setTaskCompleteList(TaskListModel value) =>
      taskListSuccess.value = value;
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

  Future<void> taskDetailApi(String? id) async {
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
      "item_id": id,
      "status": 2,
      "is_verified": true
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

  void getDetailFromNotification(String? id) async {
    //await taskDetailApi(id).then((value) => print(taskDetail.value.data?.type)); // Wait for taskDetailApi to complete before continuing
    final taskClean = TaskDetailModel();
    setTaskDetail(taskClean);
    _api.taskDetailApi(id!).then((value) {
      setTaskDetail(value);
      //print(taskDetail.value.data?.type);
      switch (taskDetail.value.data?.type) {
        case 0:
          Utils.snackBar("Thông báo", "Không tìm thấy");
        case 1:
          Get.to(() => CheckTask(taskId: id));
          break;
        case 2:
          Get.to(() => MaintainTask(taskId: id));
          break;
        case 3:
          Get.to(() => RepairTask(taskId: id));
          break;
        case 4:
          Get.to(() => ReplaceTask(taskId: id));
          break;
        case 5:
          Get.to(() => TransferTask(taskId: id));
          break;
        case 6:
          Get.to(() => InventoryTask(taskId: id), arguments: id);
          break;
        default:
          break;
      }
    }).catchError((error) {
      setError(error.toString());
      rxRequestDetailStatus(StatusAPI.ERROR);
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

  void refreshAllList() {
    setRexRequestStatus(StatusAPI.LOADING);
    setRexRequestWaitingStatus(StatusAPI.LOADING);
    setRexRequestCompleteStatus(StatusAPI.LOADING);
    setRexRequestProcessStatus(StatusAPI.LOADING);
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
