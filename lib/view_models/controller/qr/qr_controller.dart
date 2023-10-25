import 'package:FMS/utlis/utlis.dart';
import 'package:get/get.dart';

class QRController extends GetxController {
  RxString qrData = ''.obs;

  void updateQRData(String data) {
    qrData.value = data;
    Utils.snackBarSuccess("Code:", qrData.value);
  }

  void checkAssetID(String idQR, String id) {
    if (qrData.value == id) {
      Utils.snackBarSuccess("Thông Báo:", qrData.value);
    } else {
      Get.back();
      Utils.snackBarSuccess("Thông Báo:", qrData.value);
    }
  }
}
