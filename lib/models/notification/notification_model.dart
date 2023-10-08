
class NotificationListModel {
  int? totalCount;
  int? pageSize;
  int? page;
  int? totalPages;
  List<Data>? data;
  int? statusCode;
  String? message;

  NotificationListModel({this.totalCount, this.pageSize, this.page, this.totalPages, this.data, this.statusCode, this.message});

  NotificationListModel.fromJson(Map<String, dynamic> json) {
    totalCount = json["total_count"];
    pageSize = json["page_size"];
    page = json["page"];
    totalPages = json["total_pages"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    statusCode = json["status_code"];
    message = json["message"];
  }

  static List<NotificationListModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => NotificationListModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["total_count"] = totalCount;
    _data["page_size"] = pageSize;
    _data["page"] = page;
    _data["total_pages"] = totalPages;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["status_code"] = statusCode;
    _data["message"] = message;
    return _data;
  }

  NotificationListModel copyWith({
    int? totalCount,
    int? pageSize,
    int? page,
    int? totalPages,
    List<Data>? data,
    int? statusCode,
    String? message,
  }) => NotificationListModel(
    totalCount: totalCount ?? this.totalCount,
    pageSize: pageSize ?? this.pageSize,
    page: page ?? this.page,
    totalPages: totalPages ?? this.totalPages,
    data: data ?? this.data,
    statusCode: statusCode ?? this.statusCode,
    message: message ?? this.message,
  );
}

class Data {
  String? userId;
  String? title;
  String? content;
  bool? isRead;
  int? type;
  TypeObj? typeObj;
  int? status;
  StatusObj? statusObj;
  String? itemId;
  String? id;
  String? createdAt;
  String? editedAt;
  Creator? creator;

  Data({this.userId, this.title, this.content, this.isRead, this.type, this.typeObj, this.status, this.statusObj, this.itemId, this.id, this.createdAt, this.editedAt, this.creator});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json["user_id"];
    title = json["title"];
    content = json["content"];
    isRead = json["is_read"];
    type = json["type"];
    typeObj = json["type_obj"] == null ? null : TypeObj.fromJson(json["type_obj"]);
    status = json["status"];
    statusObj = json["status_obj"] == null ? null : StatusObj.fromJson(json["status_obj"]);
    itemId = json["item_id"];
    id = json["id"];
    createdAt = json["created_at"];
    editedAt = json["edited_at"];
    creator = json["creator"] == null ? null : Creator.fromJson(json["creator"]);
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["user_id"] = userId;
    _data["title"] = title;
    _data["content"] = content;
    _data["is_read"] = isRead;
    _data["type"] = type;
    if(typeObj != null) {
      _data["type_obj"] = typeObj?.toJson();
    }
    _data["status"] = status;
    if(statusObj != null) {
      _data["status_obj"] = statusObj?.toJson();
    }
    _data["item_id"] = itemId;
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["edited_at"] = editedAt;
    if(creator != null) {
      _data["creator"] = creator?.toJson();
    }
    return _data;
  }

  Data copyWith({
    String? userId,
    String? title,
    String? content,
    bool? isRead,
    int? type,
    TypeObj? typeObj,
    int? status,
    StatusObj? statusObj,
    String? itemId,
    String? id,
    String? createdAt,
    String? editedAt,
    Creator? creator,
  }) => Data(
    userId: userId ?? this.userId,
    title: title ?? this.title,
    content: content ?? this.content,
    isRead: isRead ?? this.isRead,
    type: type ?? this.type,
    typeObj: typeObj ?? this.typeObj,
    status: status ?? this.status,
    statusObj: statusObj ?? this.statusObj,
    itemId: itemId ?? this.itemId,
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    editedAt: editedAt ?? this.editedAt,
    creator: creator ?? this.creator,
  );
}

class Creator {
  String? id;
  String? fullname;
  String? email;
  String? phoneNumber;
  String? avatar;

  Creator({this.id, this.fullname, this.email, this.phoneNumber, this.avatar});

  Creator.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    fullname = json["fullname"];
    email = json["email"];
    phoneNumber = json["phone_number"];
    avatar = json["avatar"];
  }

  static List<Creator> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Creator.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["fullname"] = fullname;
    _data["email"] = email;
    _data["phone_number"] = phoneNumber;
    _data["avatar"] = avatar;
    return _data;
  }

  Creator copyWith({
    String? id,
    String? fullname,
    String? email,
    String? phoneNumber,
    String? avatar,
  }) => Creator(
    id: id ?? this.id,
    fullname: fullname ?? this.fullname,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    avatar: avatar ?? this.avatar,
  );
}

class StatusObj {
  int? value;
  String? name;
  String? displayName;

  StatusObj({this.value, this.name, this.displayName});

  StatusObj.fromJson(Map<String, dynamic> json) {
    value = json["value"];
    name = json["name"];
    displayName = json["display_name"];
  }

  static List<StatusObj> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => StatusObj.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["value"] = value;
    _data["name"] = name;
    _data["display_name"] = displayName;
    return _data;
  }

  StatusObj copyWith({
    int? value,
    String? name,
    String? displayName,
  }) => StatusObj(
    value: value ?? this.value,
    name: name ?? this.name,
    displayName: displayName ?? this.displayName,
  );
}

class TypeObj {
  int? value;
  String? name;
  String? displayName;

  TypeObj({this.value, this.name, this.displayName});

  TypeObj.fromJson(Map<String, dynamic> json) {
    value = json["value"];
    name = json["name"];
    displayName = json["display_name"];
  }

  static List<TypeObj> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => TypeObj.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["value"] = value;
    _data["name"] = name;
    _data["display_name"] = displayName;
    return _data;
  }

  TypeObj copyWith({
    int? value,
    String? name,
    String? displayName,
  }) => TypeObj(
    value: value ?? this.value,
    name: name ?? this.name,
    displayName: displayName ?? this.displayName,
  );
}