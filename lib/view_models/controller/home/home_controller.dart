import 'package:get/get.dart';
import 'package:FMS/res/repository/home_repository/home_repository.dart';

import '../../../data/response/status.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();
  final rxRequestStatus = StatusAPI.LOADING.obs;
  RxString error = ''.obs;

  // here is 2 funcation
  void setRexRequestStatus(StatusAPI _value) => rxRequestStatus.value = _value;
  void setError(String _value) => error.value = _value;


}
