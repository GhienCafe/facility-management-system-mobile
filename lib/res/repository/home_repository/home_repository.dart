import 'package:FMS/data/network/network_api_services.dart';
import 'package:FMS/models/home/user_list_model.dart';
import 'package:FMS/res/app_url/app_url.dart';

class HomeRepository {
  final _apiService = NetworkApiServices();

  Future<UserListModel> userListApi() async {
    dynamic reponse = await _apiService.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(reponse);
  }
}
