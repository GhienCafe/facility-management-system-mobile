import 'package:get/get.dart';

import '../../../data/response/status.dart';

class HomeController extends GetxController {
  //final _api = HomeRepository();
  final rxRequestStatus = StatusAPI.LOADING.obs;
  RxString error = ''.obs;

  // here is 2 funcation
  void setRexRequestStatus(StatusAPI _value) => rxRequestStatus.value = _value;
  void setError(String _value) => error.value = _value;


}
