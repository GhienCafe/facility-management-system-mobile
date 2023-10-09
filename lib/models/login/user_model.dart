class UserModel {
  Data? data;
  int? statusCode;
  String? message;

  UserModel({this.data, this.statusCode, this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
    statusCode = json["status_code"];
    message = json["message"];
  }

  static List<UserModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => UserModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    _data["status_code"] = statusCode;
    _data["message"] = message;
    return _data;
  }

  UserModel copyWith({
    Data? data,
    int? statusCode,
    String? message,
  }) =>
      UserModel(
        data: data ?? this.data,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
      );
}

class Data {
  String? userCode;
  String? fullname;
  int? role;
  String? avatar;
  String? email;
  String? phoneNumber;
  String? address;
  bool? gender;
  String? personalIdentifyNumber;
  String? dob;
  String? firstLoginAt;
  String? id;
  String? createdAt;
  String? editedAt;

  Data(
      {this.userCode,
      this.fullname,
      this.role,
      this.avatar,
      this.email,
      this.phoneNumber,
      this.address,
      this.gender,
      this.personalIdentifyNumber,
      this.dob,
      this.firstLoginAt,
      this.id,
      this.createdAt,
      this.editedAt});

  Data.fromJson(Map<String, dynamic> json) {
    userCode = json["user_code"];
    fullname = json["fullname"];
    role = json["role"];
    avatar = json["avatar"];
    email = json["email"];
    phoneNumber = json["phone_number"];
    address = json["address"];
    gender = json["gender"];
    personalIdentifyNumber = json["personal_identify_number"];
    dob = json["dob"];
    firstLoginAt = json["first_login_at"];
    id = json["id"];
    createdAt = json["created_at"];
    editedAt = json["edited_at"];
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["user_code"] = userCode;
    _data["fullname"] = fullname;
    _data["role"] = role;
    _data["avatar"] = avatar;
    _data["email"] = email;
    _data["phone_number"] = phoneNumber;
    _data["address"] = address;
    _data["gender"] = gender;
    _data["personal_identify_number"] = personalIdentifyNumber;
    _data["dob"] = dob;
    _data["first_login_at"] = firstLoginAt;
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["edited_at"] = editedAt;
    return _data;
  }

  Data copyWith({
    String? userCode,
    String? fullname,
    int? role,
    String? avatar,
    String? email,
    String? phoneNumber,
    String? address,
    bool? gender,
    String? personalIdentifyNumber,
    String? dob,
    String? firstLoginAt,
    String? id,
    String? createdAt,
    String? editedAt,
  }) =>
      Data(
        userCode: userCode ?? this.userCode,
        fullname: fullname ?? this.fullname,
        role: role ?? this.role,
        avatar: avatar ?? this.avatar,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        address: address ?? this.address,
        gender: gender ?? this.gender,
        personalIdentifyNumber:
            personalIdentifyNumber ?? this.personalIdentifyNumber,
        dob: dob ?? this.dob,
        firstLoginAt: firstLoginAt ?? this.firstLoginAt,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        editedAt: editedAt ?? this.editedAt,
      );
}
