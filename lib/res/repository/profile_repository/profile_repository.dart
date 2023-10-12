import '../../../data/network/network_api_services.dart';
import '../../../models/login/user_model.dart';
import '../../app_url/app_url.dart';

class ProfileRepository {
  final _apiService = NetworkApiServices();

  Future<UserModel> getUserInfo() async {
    dynamic response = await _apiService.getApiAuthor(AppUrl.getUserInfo);
    return UserModel.fromJson(response);
  }
  Future<dynamic> putUserInfo(var data) async {
    dynamic response = await _apiService.putApiAuthor(data, AppUrl.putUserInfo);
    return response;
  }
}