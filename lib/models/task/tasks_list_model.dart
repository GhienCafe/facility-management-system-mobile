class TaskListModel {
  int? totalCount;
  int? pageSize;
  int? page;
  int? totalPages;
  List<Data>? data;
  int? statusCode;
  String? message;

  TaskListModel({this.totalCount, this.pageSize, this.page, this.totalPages, this.data, this.statusCode, this.message});

  TaskListModel.fromJson(Map<String, dynamic> json) {
    totalCount = json["total_count"];
    pageSize = json["page_size"];
    page = json["page"];
    totalPages = json["total_pages"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    statusCode = json["status_code"];
    message = json["message"];
  }

  static List<TaskListModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => TaskListModel.fromJson(map)).toList();
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

  TaskListModel copyWith({
    int? totalCount,
    int? pageSize,
    int? page,
    int? totalPages,
    List<Data>? data,
    int? statusCode,
    String? message,
  }) => TaskListModel(
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
  int? type;
  TypeObj? typeObj;
  int? quantity;
  String? toRoomId;
  String? requestCode;
  String? requestDate;
  String? completionDate;
  int? status;
  StatusObj? statusObj;
  String? description;
  String? notes;
  bool? isInternal;
  String? assignedTo;
  String? id;
  String? createdAt;
  String? editedAt;
  Creator? creator;

  Data({this.type, this.typeObj, this.quantity, this.toRoomId, this.requestCode, this.requestDate, this.completionDate, this.status, this.statusObj, this.description, this.notes, this.isInternal, this.assignedTo, this.id, this.createdAt, this.editedAt, this.creator});

  Data.fromJson(Map<String, dynamic> json) {
    type = json["type"];
    typeObj = json["type_obj"] == null ? null : TypeObj.fromJson(json["type_obj"]);
    quantity = json["quantity"];
    toRoomId = json["to_room_id"];
    requestCode = json["request_code"];
    requestDate = json["request_date"];
    completionDate = json["completion_date"];
    status = json["status"];
    statusObj = json["status_obj"] == null ? null : StatusObj.fromJson(json["status_obj"]);
    description = json["description"];
    notes = json["notes"];
    isInternal = json["is_internal"];
    assignedTo = json["assigned_to"];
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
    _data["type"] = type;
    if(typeObj != null) {
      _data["type_obj"] = typeObj?.toJson();
    }
    _data["quantity"] = quantity;
    _data["to_room_id"] = toRoomId;
    _data["request_code"] = requestCode;
    _data["request_date"] = requestDate;
    _data["completion_date"] = completionDate;
    _data["status"] = status;
    if(statusObj != null) {
      _data["status_obj"] = statusObj?.toJson();
    }
    _data["description"] = description;
    _data["notes"] = notes;
    _data["is_internal"] = isInternal;
    _data["assigned_to"] = assignedTo;
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["edited_at"] = editedAt;
    if(creator != null) {
      _data["creator"] = creator?.toJson();
    }
    return _data;
  }

  Data copyWith({
    int? type,
    TypeObj? typeObj,
    int? quantity,
    String? toRoomId,
    String? requestCode,
    String? requestDate,
    String? completionDate,
    int? status,
    StatusObj? statusObj,
    String? description,
    String? notes,
    bool? isInternal,
    String? assignedTo,
    String? id,
    String? createdAt,
    String? editedAt,
    Creator? creator,
  }) => Data(
    type: type ?? this.type,
    typeObj: typeObj ?? this.typeObj,
    quantity: quantity ?? this.quantity,
    toRoomId: toRoomId ?? this.toRoomId,
    requestCode: requestCode ?? this.requestCode,
    requestDate: requestDate ?? this.requestDate,
    completionDate: completionDate ?? this.completionDate,
    status: status ?? this.status,
    statusObj: statusObj ?? this.statusObj,
    description: description ?? this.description,
    notes: notes ?? this.notes,
    isInternal: isInternal ?? this.isInternal,
    assignedTo: assignedTo ?? this.assignedTo,
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