import 'dart:async';

import 'package:FMS/models/task/check_task_model.dart';
import 'package:FMS/res/repository/task_repository/task_repository.dart';
import 'package:get/get.dart';
import '../../../data/response/status.dart';
import '../../../models/task/tasks_list_model.dart';

class TaskController extends GetxController {
  var isLoading = true.obs;
  final _api = TaskRepository();
  final rxRequestStatus = StatusAPI.LOADING.obs;
  final rxRequestDetailStatus = StatusAPI.LOADING.obs;
  final taskList = TaskListModel().obs;
  final taskDetail = TaskDetailModel().obs;
  RxString error = ''.obs;
  RxInt selectedIndex = 0.obs;
  RxString detailIDTask = "".obs;
  void setRexRequestStatus(StatusAPI value) => rxRequestStatus.value = value;
  void setRexRequestDetailStatus(StatusAPI value) => rxRequestDetailStatus.value = value;
  void setTaskList(TaskListModel value) => taskList.value = value;
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

  void taskDetailApi(String? id){
    rxRequestDetailStatus(StatusAPI.LOADING);
    _api.taskDetailApi(id!).then((value) => {
      setTaskDetail(value),
      rxRequestDetailStatus(StatusAPI.COMPLETED),

    })
        .onError((error, stackTrace) => {
      setError(error.toString()),
      rxRequestDetailStatus(StatusAPI.ERROR),
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
}
