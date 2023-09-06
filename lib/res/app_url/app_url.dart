import 'dart:core';

class AppUrl {
  // we break url because in future we change the server so we don't need to change the all urls we will change only server base url
  static const String baseUrl = 'https://reqres.in';
  static const String loginApi = '$baseUrl/api/login';
  static const String loginApiToken = '$baseUrl/api/login';
  static const String userListApi =
      'https://webhook.site/f00a7330-d81d-4622-913a-c2058fdaf076';
}
