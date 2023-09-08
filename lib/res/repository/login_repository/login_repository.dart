import 'package:FMS/data/network/network_api_services.dart';
import 'package:FMS/res/app_url/app_url.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> loginApi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.loginApi);
    return response;
  }
  Future<dynamic> loginApiToken(var token) async {
    dynamic response = await _apiService.postApi(token, AppUrl.loginApiToken);
    return response;
  }
}
