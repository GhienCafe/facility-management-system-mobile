import 'package:FMS/res/repository/home_repository/statistic_repository.dart';
import 'package:get/get.dart';

import '../../../data/response/status.dart';
import '../../../models/statistics/statistics_model.dart';

class StatisticsController extends GetxController {
  RxString error = ''.obs;
  final _api = StatisticRepository();
  final rxRequestStatus = StatusAPI.LOADING.obs;
  final statistic = StatisticsModel().obs;

  void setRexRequestStatus(StatusAPI _value) => rxRequestStatus.value = _value;
  void setCurrentStatisticsInfo(StatisticsModel _value) => statistic.value = _value;
  void setError(String _value) => error.value = _value;

  void getStatistics() {
    _api
        .getStatisticsApi()
        .then((value) => {
      setRexRequestStatus(StatusAPI.COMPLETED),
      setCurrentStatisticsInfo(value),
    })
        .onError((error, stackTrace) => {
      setError(error.toString()),
      setRexRequestStatus(StatusAPI.ERROR),
    });

  }

  void refreshStatisticsInfoApi() {
    setRexRequestStatus(StatusAPI.LOADING);
    _api.getStatisticsApi()
        .then((value) => {
      setRexRequestStatus(StatusAPI.COMPLETED),
      setCurrentStatisticsInfo(value),
    })
        .onError((error, stackTrace) => {
      setError(error.toString()),
      setRexRequestStatus(StatusAPI.ERROR),
    });
  }
}
