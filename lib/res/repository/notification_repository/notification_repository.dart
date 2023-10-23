import 'package:FMS/data/network/network_api_services.dart';
import 'package:FMS/res/app_url/app_url.dart';
import '../../../models/notification/notification_model.dart';

class NotificationRepository {
  final _apiService = NetworkApiServices();

  Future<NotificationListModel> notificationListApi() async {
    dynamic response = await _apiService.getApiAuthor(AppUrl.getListNotification);
    return NotificationListModel.fromJson(response);
  }

  Future<dynamic> readNotificationApi(String id) async {
    dynamic response = await _apiService.putApiAuthorNoData("${AppUrl.putIdNotification}/$id");
    return response;
  }
}