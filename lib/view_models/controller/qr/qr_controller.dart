// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
//
// class QRCodeController extends GetxController {
//   QRViewController qrController;
//   String qrData = "";
//
//   @override
//   void onInit() {
//     super.onInit();
//     qrController = QRViewController();
//     qrController.initialize().then((value) {
//       qrController.startScanning();
//     });
//   }
//
//   void onQRCodeScanned(String data) {
//     qrData = data;
//     update();
//   }
// }