import 'package:FMS/res/repository/task_repository/task_repository.dart';
import 'package:get/get.dart';
import '../../../data/response/status.dart';
import '../../../models/task/tasks_list_model.dart';

class TaskController extends GetxController {
  var isLoading = true.obs;
  RxList<Data> allItems = <Data>[].obs;
  RxList<Data> processingItems = <Data>[].obs;
  RxList<Data> completedItems = <Data>[].obs;
  final _api = TaskRepository();
  final rxRequestStatus = StatusAPI.LOADING.obs;
  final taskList = TaskListModel().obs;
  RxString error = ''.obs;
  RxInt selectedIndex = 0.obs;
  void setRexRequestStatus(StatusAPI value) => rxRequestStatus.value = value;
  void setTaskList(TaskListModel value) => taskList.value = value;
  void setError(String value) => error.value = value;

  void taskListApi() {
    _api
        .taskListApi()
        .then((value) => {
              setRexRequestStatus(StatusAPI.COMPLETED),
              setTaskList(value),
              // After getting the data, filter and assign to different lists
              // allItems.assignAll(value.data ?? []), // Assign all items
              // processingItems.assignAll(value.data
              //         ?.where((item) => item.status?.value == 1)
              //         .toList() ??
              //     []), // Assign items with status.value = 1
              // completedItems.assignAll(value.data
              //         ?.where((item) => item.status?.value == 2)
              //         .toList() ??
              //     []),
            })
        .onError((error, stackTrace) => {
              setError(error.toString()),
              setRexRequestStatus(StatusAPI.ERROR),
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
