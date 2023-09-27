import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:FMS/res/color/colors.dart';

class Utils {
  // we user write the email and sift to password
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.grey,
        gravity: ToastGravity.BOTTOM);
  }

  static toastMessageCenter(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.grey,
        gravity: ToastGravity.CENTER);
  }

  static snackBar(String title, String message) {
    Get.snackbar(title, message,backgroundColor: Colors.grey,colorText: AppColor.whiteColor);
  }
  static snackBarSuccess(String title, String message) {
    Get.snackbar(title, message,backgroundColor: Colors.green,colorText: AppColor.whiteColor);
  }
  static snackBarError(String title, String message) {
    Get.snackbar(title, message,backgroundColor: Colors.red,colorText: AppColor.whiteColor);
  }
}
