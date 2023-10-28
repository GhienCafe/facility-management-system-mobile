import 'package:FMS/utlis/utlis.dart';
import 'package:get/get.dart';

import '../../../data/response/status.dart';
import '../../../models/assets/asset_model.dart';
import '../../../res/repository/qr_repository/qr_repository.dart';
import '../../../view/qr_code/qr_asset/qr_view_asset.dart';

class QRController extends GetxController {
  RxString qrData = ''.obs;
  RxString error = ''.obs;
  final rxRequestStatus = StatusAPI.LOADING.obs;
  final asset = AssetModel().obs;
  final _api = QRRepository();
  void setRexRequestStatus(StatusAPI _value) => rxRequestStatus.value = _value;
  void setCurrentAsset(AssetModel _value) => asset.value = _value;
  void setError(String _value) => error.value = _value;

  void getCurrentAsset(String id) {
    _api
        .scanAsset(id)
        .then((value) => {
      setRexRequestStatus(StatusAPI.COMPLETED),
      setCurrentAsset(value),
      Get.to(() => QRResultAsset(id: id,))
    })
        .onError((error, stackTrace) => {
      setError(error.toString()),
      setRexRequestStatus(StatusAPI.ERROR),
    });
  }

  void refreshApi(String id) {
    setRexRequestStatus(StatusAPI.LOADING);
    _api
        .scanAsset(id)
        .then((value) => {
      setRexRequestStatus(StatusAPI.COMPLETED),
      setCurrentAsset(value),
    })
        .onError((error, stackTrace) => {
      setError(error.toString()),
      setRexRequestStatus(StatusAPI.ERROR),
    });
  }

  void updateQRData(String data) {
    qrData.value = '';
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
