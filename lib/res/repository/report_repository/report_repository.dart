import '../../../data/network/network_api_services.dart';
import '../../app_url/app_url.dart';

class ReportRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> reportTask(var data) async {
    dynamic response = await _apiService.putApiAuthor(data, AppUrl.updateTask);
    return response;
  }
}
