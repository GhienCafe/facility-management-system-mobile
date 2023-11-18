import 'dart:core';

class AppUrl {
  static const String baseUrl = 'http://14.225.254.145:5000/api/v1';

  //authentication API
  static const String loginApi = '$baseUrl/auth/sign-in';
  static const String loginApiToken = '$baseUrl/auth/token-sign';
  static const String setFCMToken = '$baseUrl/auth/check-token-device';
  static const String refreshToken = '$baseUrl/auth/refresh-token';

  //User API
  static const String getUserInfo = '$baseUrl/account/infor';
  static const String putUserInfo = '$baseUrl/account';

  //Notification API
  static const String getListNotification = '$baseUrl/notification?order_by=CreatedAt%20desc';
  static const String putIdNotification = '$baseUrl/notification';

  //Tasks API
  static const String getListTask = '$baseUrl/task?order_by=RequestDate%20desc';
  static const String getListProcessTask = '$baseUrl/task?status=2&order_by=RequestDate%20desc';
  static const String getListWaitingTask = '$baseUrl/task?status=1&order_by=RequestDate%20desc';
  static const String getListCompleteTask = '$baseUrl/task?status=4&order_by=RequestDate%20desc';
  static const String getDetailTask = '$baseUrl/task';
  static const String updateTask = '$baseUrl/task?status=2';
  static const String reportTask = '$baseUrl/task?status=3';

  //Asset API
  static const String getAsset = '$baseUrl/asset';

  //Room API
  static const String getInfoRoom = '$baseUrl/room';
  static const String getAssetInRoom = '$baseUrl/asset/room';

  //Statistic API
  static const String getStatistic = '$baseUrl/dashboard/stastic-task';

  // Example
  static const String userListApi =
      'https://webhook.site/f00a7330-d81d-4622-913a-c2058fdaf076';
}
