class TaskListModel {
  int? totalCount;
  int? pageSize;
  int? offset;
  int? totalPages;
  List<Data>? data;
  int? statusCode;
  String? message;

  TaskListModel(
      {this.totalCount,
      this.pageSize,
      this.offset,
      this.totalPages,
      this.data,
      this.statusCode,
      this.message});

  TaskListModel.fromJson(Map<String, dynamic> json) {
    totalCount = json["total_count"];
    pageSize = json["page_size"];
    offset = json["offset"];
    totalPages = json["total_pages"];
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
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
    _data["offset"] = offset;
    _data["total_pages"] = totalPages;
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["status_code"] = statusCode;
    _data["message"] = message;
    return _data;
  }

  TaskListModel copyWith({
    int? totalCount,
    int? pageSize,
    int? offset,
    int? totalPages,
    List<Data>? data,
    int? statusCode,
    String? message,
  }) =>
      TaskListModel(
        totalCount: totalCount ?? this.totalCount,
        pageSize: pageSize ?? this.pageSize,
        offset: offset ?? this.offset,
        totalPages: totalPages ?? this.totalPages,
        data: data ?? this.data,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
      );
}

class Data {
  String? title;
  String? content;
  String? notificationDate;
  String? requestedDate;
  String? description;
  Status? status;
  Type? type;
  String? assignedTo;
  String? assetId;
  Location? location;
  String? id;
  String? createdAt;
  String? editedAt;
  Creator? creator;

  Data(
      {this.title,
      this.content,
      this.notificationDate,
      this.requestedDate,
      this.description,
      this.status,
      this.type,
      this.assignedTo,
      this.assetId,
      this.location,
      this.id,
      this.createdAt,
      this.editedAt,
      this.creator});

  Data.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    content = json["content"];
    notificationDate = json["notification_date"];
    requestedDate = json["requested_date"];
    description = json["description"];
    status = json["status"] == null ? null : Status.fromJson(json["status"]);
    type = json["type"] == null ? null : Type.fromJson(json["type"]);
    assignedTo = json["assigned_to"];
    assetId = json["asset_id"];
    location =
        json["location"] == null ? null : Location.fromJson(json["location"]);
    id = json["id"];
    createdAt = json["created_at"];
    editedAt = json["edited_at"];
    creator =
        json["creator"] == null ? null : Creator.fromJson(json["creator"]);
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["content"] = content;
    _data["notification_date"] = notificationDate;
    _data["requested_date"] = requestedDate;
    _data["description"] = description;
    if (status != null) {
      _data["status"] = status?.toJson();
    }
    if (type != null) {
      _data["type"] = type?.toJson();
    }
    _data["assigned_to"] = assignedTo;
    _data["asset_id"] = assetId;
    if (location != null) {
      _data["location"] = location?.toJson();
    }
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["edited_at"] = editedAt;
    if (creator != null) {
      _data["creator"] = creator?.toJson();
    }
    return _data;
  }

  Data copyWith({
    String? title,
    String? content,
    String? notificationDate,
    String? requestedDate,
    String? description,
    Status? status,
    Type? type,
    String? assignedTo,
    String? assetId,
    Location? location,
    String? id,
    String? createdAt,
    String? editedAt,
    Creator? creator,
  }) =>
      Data(
        title: title ?? this.title,
        content: content ?? this.content,
        notificationDate: notificationDate ?? this.notificationDate,
        requestedDate: requestedDate ?? this.requestedDate,
        description: description ?? this.description,
        status: status ?? this.status,
        type: type ?? this.type,
        assignedTo: assignedTo ?? this.assignedTo,
        assetId: assetId ?? this.assetId,
        location: location ?? this.location,
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

  Creator({this.id, this.fullname, this.email, this.phoneNumber});

  Creator.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    fullname = json["fullname"];
    email = json["email"];
    phoneNumber = json["phone_number"];
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
    return _data;
  }

  Creator copyWith({
    String? id,
    String? fullname,
    String? email,
    String? phoneNumber,
  }) =>
      Creator(
        id: id ?? this.id,
        fullname: fullname ?? this.fullname,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );
}

class Location {
  String? roomName;
  int? area;
  String? pathRoom;
  String? roomCode;
  String? roomTypeId;
  int? capacity;
  String? statusId;
  String? floorId;
  String? id;
  String? createdAt;
  String? editedAt;

  Location(
      {this.roomName,
      this.area,
      this.pathRoom,
      this.roomCode,
      this.roomTypeId,
      this.capacity,
      this.statusId,
      this.floorId,
      this.id,
      this.createdAt,
      this.editedAt});

  Location.fromJson(Map<String, dynamic> json) {
    roomName = json["room_name"];
    area = json["area"];
    pathRoom = json["path_room"];
    roomCode = json["room_code"];
    roomTypeId = json["room_type_id"];
    capacity = json["capacity"];
    statusId = json["status_id"];
    floorId = json["floor_id"];
    id = json["id"];
    createdAt = json["created_at"];
    editedAt = json["edited_at"];
  }

  static List<Location> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Location.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["room_name"] = roomName;
    _data["area"] = area;
    _data["path_room"] = pathRoom;
    _data["room_code"] = roomCode;
    _data["room_type_id"] = roomTypeId;
    _data["capacity"] = capacity;
    _data["status_id"] = statusId;
    _data["floor_id"] = floorId;
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["edited_at"] = editedAt;
    return _data;
  }

  Location copyWith({
    String? roomName,
    int? area,
    String? pathRoom,
    String? roomCode,
    String? roomTypeId,
    int? capacity,
    String? statusId,
    String? floorId,
    String? id,
    String? createdAt,
    String? editedAt,
  }) =>
      Location(
        roomName: roomName ?? this.roomName,
        area: area ?? this.area,
        pathRoom: pathRoom ?? this.pathRoom,
        roomCode: roomCode ?? this.roomCode,
        roomTypeId: roomTypeId ?? this.roomTypeId,
        capacity: capacity ?? this.capacity,
        statusId: statusId ?? this.statusId,
        floorId: floorId ?? this.floorId,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        editedAt: editedAt ?? this.editedAt,
      );
}

class Type {
  int? value;
  String? name;
  String? displayName;

  Type({this.value, this.name, this.displayName});

  Type.fromJson(Map<String, dynamic> json) {
    value = json["value"];
    name = json["name"];
    displayName = json["display_name"];
  }

  static List<Type> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Type.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["value"] = value;
    _data["name"] = name;
    _data["display_name"] = displayName;
    return _data;
  }

  Type copyWith({
    int? value,
    String? name,
    String? displayName,
  }) =>
      Type(
        value: value ?? this.value,
        name: name ?? this.name,
        displayName: displayName ?? this.displayName,
      );
}

class Status {
  int? value;
  String? name;
  String? displayName;

  Status({this.value, this.name, this.displayName});

  Status.fromJson(Map<String, dynamic> json) {
    value = json["value"];
    name = json["name"];
    displayName = json["display_name"];
  }

  static List<Status> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Status.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["value"] = value;
    _data["name"] = name;
    _data["display_name"] = displayName;
    return _data;
  }

  Status copyWith({
    int? value,
    String? name,
    String? displayName,
  }) =>
      Status(
        value: value ?? this.value,
        name: name ?? this.name,
        displayName: displayName ?? this.displayName,
      );
}
