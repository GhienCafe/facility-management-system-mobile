import 'dart:core';

class AppUrl {
  // we break url because in future we change the server so we don't need to change the all urls we will change only server base url
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
  static const String getListNotification = '$baseUrl/notification?order_by=created_at%20desc';

  //Tasks API
  static const String getListTask = '$baseUrl/task?order_by=RequestDate%20desc';
  static const String getDetailTask = '$baseUrl/task';

  //Asset API

  // Example
  static const String userListApi =
      'https://webhook.site/f00a7330-d81d-4622-913a-c2058fdaf076';
}
