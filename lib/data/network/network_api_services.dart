import 'dart:convert';
import 'dart:io';

import 'package:FMS/utlis/utlis.dart';
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

  dynamic returnResponse(http.Response response) {
    //print(response.body.toString());
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        Utlis.snackBar("Đăng nhập thất bại: ", "Sai mật khẩu");
        return responseJson;
      case 404:
        dynamic responseJson = jsonDecode(response.body);
        Utlis.snackBar("Đăng nhập thất bại: ", "Tài khoản không tồn tại");
        return responseJson;
      default:
        throw FetchDataException(
            'error while communication ' + response.statusCode.toString());
    }
  }
}
