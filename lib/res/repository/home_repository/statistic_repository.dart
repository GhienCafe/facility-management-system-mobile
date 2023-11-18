import '../../../data/network/network_api_services.dart';
import '../../../models/statistics/statistics_model.dart';
import '../../app_url/app_url.dart';

class StatisticRepository {
  final _apiService = NetworkApiServices();
  Future<StatisticsModel> getStatisticsApi() async {
    dynamic response = await _apiService.getApiAuthor(AppUrl.getStatistic);
    return StatisticsModel.fromJson(response);
  }
}
