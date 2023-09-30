import 'package:get/get.dart';
import 'package:FMS/models/home/user_list_model.dart';
import 'package:FMS/res/repository/home_repository/home_repository.dart';

import '../../../data/response/status.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();
  final rxRequestStatus = StatusAPI.LOADING.obs;
  final userList = UserListModel().obs;
  // to handle the error
  RxString error = ''.obs;

  // here is 2 funcation
  void setRexRequestStatus(StatusAPI _value) => rxRequestStatus.value = _value;
  void setUserList(UserListModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  //a
  void userListApi() {
    _api
        .userListApi()
        .then((value) => {
              setRexRequestStatus(StatusAPI.COMPLETED),
              setUserList(value),
            })
        .onError((error, stackTrace) => {
              setError(error.toString()),
              setRexRequestStatus(StatusAPI.ERROR),
            });
  }

  // use when there is no intenet connection so we use this method to reacll api
  void refreshApi() {
    setRexRequestStatus(StatusAPI.LOADING);
    _api
        .userListApi()
        .then((value) => {
              setRexRequestStatus(StatusAPI.COMPLETED),
              setUserList(value),
            })
        .onError((error, stackTrace) => {
              setError(error.toString()),
              setRexRequestStatus(StatusAPI.ERROR),
            });
  }
}
