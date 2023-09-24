

class UsersModel {
  Data? data;
  int? statusCode;
  String? message;

  UsersModel({this.data, this.statusCode, this.message});

  UsersModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
    statusCode = json["status_code"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    _data["status_code"] = statusCode;
    _data["message"] = message;
    return _data;
  }
}

class Data {
  String? accessToken;
  String? refreshToken;
  String? accessExpiredAt;
  String? refreshExpiredAt;
  String? email;
  String? fullname;
  int? role;
  String? userId;
  bool? isFirstLogin;

  Data({this.accessToken, this.refreshToken, this.accessExpiredAt, this.refreshExpiredAt, this.email, this.fullname, this.role, this.userId, this.isFirstLogin});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json["access_token"];
    refreshToken = json["refresh_token"];
    accessExpiredAt = json["access_expired_at"];
    refreshExpiredAt = json["refresh_expired_at"];
    email = json["email"];
    fullname = json["fullname"];
    role = json["role"];
    userId = json["user_id"];
    isFirstLogin = json["is_first_login"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["access_token"] = accessToken;
    _data["refresh_token"] = refreshToken;
    _data["access_expired_at"] = accessExpiredAt;
    _data["refresh_expired_at"] = refreshExpiredAt;
    _data["email"] = email;
    _data["fullname"] = fullname;
    _data["role"] = role;
    _data["user_id"] = userId;
    _data["is_first_login"] = isFirstLogin;
    return _data;
  }
}