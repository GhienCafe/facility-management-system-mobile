import 'dart:core';

class AppUrl {
  // we break url because in future we change the server so we don't need to change the all urls we will change only server base url

  static const String baseUrl = 'http://20.212.57.183:5000/api/v1';
  static const String loginApi = '$baseUrl/auth/sign-in';
  static const String loginApiToken = '$baseUrl/auth/token-sign';
  static const String getUserInfo = '$baseUrl/account/infor';
  static const String userListApi =
      'https://webhook.site/f00a7330-d81d-4622-913a-c2058fdaf076';
}
