import 'dart:core';

class AppUrl {
  // we break url because in future we change the server so we don't need to change the all urls we will change only server base url
  static const String baseUrl = 'http://20.212.57.183:5000/api/v1';

  //authentication API
  static const String loginApi = '$baseUrl/auth/sign-in';
  static const String loginApiToken = '$baseUrl/auth/token-sign';
  static const String setFCMToken = '$baseUrl/auth/check-token-device';

  //User API
  static const String getUserInfo = '$baseUrl/account/infor';

  //Notification API
  static const String getListNotification = '$baseUrl/notification';

  // Example
  static const String userListApi =
      'https://webhook.site/f00a7330-d81d-4622-913a-c2058fdaf076';
}
