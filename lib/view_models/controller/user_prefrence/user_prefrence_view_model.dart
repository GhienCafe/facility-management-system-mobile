import 'package:FMS/models/login/user_model.dart';
import 'package:FMS/models/login/users_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  Future<bool> saveUser(UserModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    // Use setString to store the token in SharedPreferences
    sp.setString('token', responseModel.token.toString());
    sp.setBool('isLogin', responseModel.isLogin!);
    return true;
  }

  Future<bool> saveUserInfoPreferences(UsersModel responseModel) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('access_token', responseModel.data!.accessToken.toString());
    prefs.setString(
        'refresh_token', responseModel.data!.refreshToken.toString());
    prefs.setString('email', responseModel.data!.email.toString());
    prefs.setString('fullname', responseModel.data!.fullname.toString());
    prefs.setInt('role', responseModel.data!.role as int);
    prefs.setString('user_id', responseModel.data!.toString());
    //prefs.setBool('is_first_login', responseModel.data.isFirstLogin);
    return true;
  }

  Future<UsersModel> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');
    String? refreshToken = prefs.getString("refresh_token");
    String? email = prefs.getString('email');
    String? fullname = prefs.getString('fullname');
    int? role = prefs.getInt("role");
    return UsersModel(
      data: Data(
        accessToken: token,
        refreshToken: refreshToken,
        email: email,
        fullname: fullname,
        role: role,
      ), // Set to null or provide a default value as needed
    );
  }

  Future<UserModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    bool? isLogin = sp.getBool('isLogin');
    return UserModel(
      token: token,
      isLogin: isLogin,
    );
  }

  //to delete user data
  Future<void> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}
