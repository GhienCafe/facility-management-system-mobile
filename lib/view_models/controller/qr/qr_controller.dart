import 'package:get/get.dart';

class QRController extends GetxController {
  RxString qrData = ''.obs;

  void updateQRData(String data) {
    qrData.value = data;
  }
}