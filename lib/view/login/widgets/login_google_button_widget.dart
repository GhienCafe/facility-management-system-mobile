import 'package:FMS/res/routes/routes_name.dart';
import 'package:FMS/utlis/utlis.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/components/round_button.dart';
import '../../../view_models/controller/login/login_controller.dart';

class LoginGoogleButton extends StatelessWidget {
  LoginGoogleButton({super.key});
  final loginVM = Get.put(LoginViewModel());
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Future<void> sendTokenToApi(String token) async {
  //   final apiUrl = 'https://example/api/v1/login';
  //   final headers = {'Authorization': 'Bearer $token'};
  //
  //   try {
  //     final response = await http.post(
  //       Uri.parse(apiUrl),
  //       headers: headers,
  //     );
  //
  //     if (response.statusCode == 200) {
  //       // Authentication was successful, proceed to the home page
  //       // You can navigate to the home page here
  //     } else {
  //       // Authentication failed, handle the error as needed
  //       print('API Authentication Error: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     print('API Request Error: $error');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => RoundButton(
        loading: loginVM.loading.value,
        onPress: () async {
          final User? user = await loginVM.handleSignIn();
          if (user != null) {
            // Handle successful Google sign-in here
            // You can navigate to a new screen or perform any other action
            Get.toNamed(RouteName.homeScreen);
            Utlis.snackBar('Xin chào: ', "${_auth.currentUser?.displayName}");
          } else {
            // Handle Google sign-in failure
            Utlis.snackBar('Có lỗi xảy ra: ', "Thử lại hoặc sử dụng mail khác.");

          }
        },
        title: "Đăng Nhập Với Google",
        width: 500,
      ),
    );
  }
}
