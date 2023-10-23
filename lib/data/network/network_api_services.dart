import 'dart:convert';
import 'dart:io';

import 'package:FMS/models/login/users_model.dart';
import 'package:FMS/view_models/controller/user_prefrence/user_prefrence_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:FMS/data/app_exceptions.dart';
import 'package:FMS/data/network/base_api_services.dart';

class NetworkApiServices extends BaseApiService {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      // responseJson = returnResponse(response);
      responseJson = jsonDecode(response.body);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOUt {
      throw RequestTimeOUt();
    }
    return responseJson;
  }

  Future<dynamic> getApiAuthor(String url) async {
    dynamic responseJson;
    try {
      UserPreference userPreference = UserPreference();
      UsersModel userInfo = await userPreference.getUserInfo();
      String? accessToken = userInfo.data?.accessToken;
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          "content-type": "application/json",
          "accept": "application/json",
          'Authorization': 'Bearer $accessToken',
        },
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOUt {
      throw RequestTimeOUt();
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url),
              headers: <String, String>{
                "content-type": "application/json",
                "accept": "application/json",
              },
              body: jsonEncode(data))
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
      //responseJson = jsonDecode(response.body);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOUt {
      throw RequestTimeOUt();
    }
    // if (kDebugMode) {
    //   print("json response: $responseJson");
    // }
    return responseJson;
  }

  Future<dynamic> postApiAuthor(var data, String url) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }
    dynamic responseJson;
    try {
      UserPreference userPreference = UserPreference();
      UsersModel userInfo = await userPreference.getUserInfo();
      String? accessToken = userInfo.data?.accessToken;
      final response = await http
          .post(Uri.parse(url),
              headers: <String, String>{
                "content-type": "application/json",
                "accept": "application/json",
                'Authorization': 'Bearer $accessToken',
              },
              body: jsonEncode(data))
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOUt {
      throw RequestTimeOUt();
    }
    return responseJson;
  }

  @override
  Future<dynamic> putApi(var data, String url) async {
    dynamic responseJson;
    try {
      final response = await http
          .put(Uri.parse(url),
              headers: <String, String>{
                "content-type": "application/json",
                "accept": "application/json",
              },
              body: jsonEncode(data))
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOUt {
      throw RequestTimeOUt();
    }
    return responseJson;
  }

  Future<dynamic> putApiAuthor(var data, String url) async {
    dynamic responseJson;
    try {
      UserPreference userPreference = UserPreference();
      UsersModel userInfo = await userPreference.getUserInfo();
      String? accessToken = userInfo.data?.accessToken;
      final response = await http
          .put(Uri.parse(url),
              headers: <String, String>{
                "content-type": "application/json",
                "accept": "application/json",
                'Authorization': 'Bearer $accessToken',
              },
              body: jsonEncode(data))
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOUt {
      throw RequestTimeOUt();
    }
    return responseJson;
  }

  Future<dynamic> putApiAuthorNoData(String url) async {
    dynamic responseJson;
    try {
      UserPreference userPreference = UserPreference();
      UsersModel userInfo = await userPreference.getUserInfo();
      String? accessToken = userInfo.data?.accessToken;
      final response = await http
          .put(Uri.parse(url),
          headers: <String, String>{
            "content-type": "application/json",
            "accept": "application/json",
            'Authorization': 'Bearer $accessToken',
          },)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOUt {
      throw RequestTimeOUt();
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    print("Return status: ${response.statusCode}");
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 404:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataException(
            'error while communication: ${response.statusCode}');
    }
  }
}
