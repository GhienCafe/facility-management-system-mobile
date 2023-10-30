class RoomModel {
  int? statusCode;
  String? message;
  Data? data;

  RoomModel({this.statusCode, this.message, this.data});

  RoomModel.fromJson(Map<String, dynamic> json) {
    statusCode = json["status_code"];
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  static List<RoomModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => RoomModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status_code"] = statusCode;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }

  RoomModel copyWith({
    int? statusCode,
    String? message,
    Data? data,
  }) => RoomModel(
    statusCode: statusCode ?? this.statusCode,
    message: message ?? this.message,
    data: data ?? this.data,
  );
}

class Data {
  String? id;
  String? createdAt;
  String? editedAt;
  Creator? creator;
  Editor? editor;
  String? roomName;
  int? area;
  String? pathRoom;
  String? roomCode;
  String? description;
  String? roomTypeId;
  int? capacity;
  String? statusId;
  String? floorId;
  Status? status;
  RoomType? roomType;

  Data({this.id, this.createdAt, this.editedAt, this.creator, this.editor, this.roomName, this.area, this.pathRoom, this.roomCode, this.description, this.roomTypeId, this.capacity, this.statusId, this.floorId, this.status, this.roomType});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    editedAt = json["edited_at"];
    creator = json["creator"] == null ? null : Creator.fromJson(json["creator"]);
    editor = json["editor"] == null ? null : Editor.fromJson(json["editor"]);
    roomName = json["room_name"];
    area = json["area"];
    pathRoom = json["path_room"];
    roomCode = json["room_code"];
    description = json["description"];
    roomTypeId = json["room_type_id"];
    capacity = json["capacity"];
    statusId = json["status_id"];
    floorId = json["floor_id"];
    status = json["status"] == null ? null : Status.fromJson(json["status"]);
    roomType = json["room_type"] == null ? null : RoomType.fromJson(json["room_type"]);
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["edited_at"] = editedAt;
    if(creator != null) {
      _data["creator"] = creator?.toJson();
    }
    if(editor != null) {
      _data["editor"] = editor?.toJson();
    }
    _data["room_name"] = roomName;
    _data["area"] = area;
    _data["path_room"] = pathRoom;
    _data["room_code"] = roomCode;
    _data["description"] = description;
    _data["room_type_id"] = roomTypeId;
    _data["capacity"] = capacity;
    _data["status_id"] = statusId;
    _data["floor_id"] = floorId;
    if(status != null) {
      _data["status"] = status?.toJson();
    }
    if(roomType != null) {
      _data["room_type"] = roomType?.toJson();
    }
    return _data;
  }

  Data copyWith({
    String? id,
    String? createdAt,
    String? editedAt,
    Creator? creator,
    Editor? editor,
    String? roomName,
    int? area,
    String? pathRoom,
    String? roomCode,
    String? description,
    String? roomTypeId,
    int? capacity,
    String? statusId,
    String? floorId,
    Status? status,
    RoomType? roomType,
  }) => Data(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    editedAt: editedAt ?? this.editedAt,
    creator: creator ?? this.creator,
    editor: editor ?? this.editor,
    roomName: roomName ?? this.roomName,
    area: area ?? this.area,
    pathRoom: pathRoom ?? this.pathRoom,
    roomCode: roomCode ?? this.roomCode,
    description: description ?? this.description,
    roomTypeId: roomTypeId ?? this.roomTypeId,
    capacity: capacity ?? this.capacity,
    statusId: statusId ?? this.statusId,
    floorId: floorId ?? this.floorId,
    status: status ?? this.status,
    roomType: roomType ?? this.roomType,
  );
}

class RoomType {
  String? id;
  String? createdAt;
  String? editedAt;
  Creator2? creator;
  Editor2? editor;
  String? typeName;
  String? description;

  RoomType({this.id, this.createdAt, this.editedAt, this.creator, this.editor, this.typeName, this.description});

  RoomType.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    editedAt = json["edited_at"];
    creator = json["creator"] == null ? null : Creator2.fromJson(json["creator"]);
    editor = json["editor"] == null ? null : Editor2.fromJson(json["editor"]);
    typeName = json["type_name"];
    description = json["description"];
  }

  static List<RoomType> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => RoomType.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["edited_at"] = editedAt;
    if(creator != null) {
      _data["creator"] = creator?.toJson();
    }
    if(editor != null) {
      _data["editor"] = editor?.toJson();
    }
    _data["type_name"] = typeName;
    _data["description"] = description;
    return _data;
  }

  RoomType copyWith({
    String? id,
    String? createdAt,
    String? editedAt,
    Creator2? creator,
    Editor2? editor,
    String? typeName,
    String? description,
  }) => RoomType(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    editedAt: editedAt ?? this.editedAt,
    creator: creator ?? this.creator,
    editor: editor ?? this.editor,
    typeName: typeName ?? this.typeName,
    description: description ?? this.description,
  );
}

class Editor2 {
  String? id;
  String? fullname;
  String? email;
  String? phoneNumber;
  String? avatar;

  Editor2({this.id, this.fullname, this.email, this.phoneNumber, this.avatar});

  Editor2.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    fullname = json["fullname"];
    email = json["email"];
    phoneNumber = json["phone_number"];
    avatar = json["avatar"];
  }

  static List<Editor2> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Editor2.fromJson(map)).toList();
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

  Editor2 copyWith({
    String? id,
    String? fullname,
    String? email,
    String? phoneNumber,
    String? avatar,
  }) => Editor2(
    id: id ?? this.id,
    fullname: fullname ?? this.fullname,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    avatar: avatar ?? this.avatar,
  );
}

class Creator2 {
  String? id;
  String? fullname;
  String? email;
  String? phoneNumber;
  String? avatar;

  Creator2({this.id, this.fullname, this.email, this.phoneNumber, this.avatar});

  Creator2.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    fullname = json["fullname"];
    email = json["email"];
    phoneNumber = json["phone_number"];
    avatar = json["avatar"];
  }

  static List<Creator2> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Creator2.fromJson(map)).toList();
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

  Creator2 copyWith({
    String? id,
    String? fullname,
    String? email,
    String? phoneNumber,
    String? avatar,
  }) => Creator2(
    id: id ?? this.id,
    fullname: fullname ?? this.fullname,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    avatar: avatar ?? this.avatar,
  );
}

class Status {
  String? id;
  String? createdAt;
  String? editedAt;
  Creator1? creator;
  Editor1? editor;
  String? statusName;
  String? description;
  String? color;

  Status({this.id, this.createdAt, this.editedAt, this.creator, this.editor, this.statusName, this.description, this.color});

  Status.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    editedAt = json["edited_at"];
    creator = json["creator"] == null ? null : Creator1.fromJson(json["creator"]);
    editor = json["editor"] == null ? null : Editor1.fromJson(json["editor"]);
    statusName = json["status_name"];
    description = json["description"];
    color = json["color"];
  }

  static List<Status> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Status.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["edited_at"] = editedAt;
    if(creator != null) {
      _data["creator"] = creator?.toJson();
    }
    if(editor != null) {
      _data["editor"] = editor?.toJson();
    }
    _data["status_name"] = statusName;
    _data["description"] = description;
    _data["color"] = color;
    return _data;
  }

  Status copyWith({
    String? id,
    String? createdAt,
    String? editedAt,
    Creator1? creator,
    Editor1? editor,
    String? statusName,
    String? description,
    String? color,
  }) => Status(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    editedAt: editedAt ?? this.editedAt,
    creator: creator ?? this.creator,
    editor: editor ?? this.editor,
    statusName: statusName ?? this.statusName,
    description: description ?? this.description,
    color: color ?? this.color,
  );
}

class Editor1 {
  String? id;
  String? fullname;
  String? email;
  String? phoneNumber;
  String? avatar;

  Editor1({this.id, this.fullname, this.email, this.phoneNumber, this.avatar});

  Editor1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    fullname = json["fullname"];
    email = json["email"];
    phoneNumber = json["phone_number"];
    avatar = json["avatar"];
  }

  static List<Editor1> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Editor1.fromJson(map)).toList();
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

  Editor1 copyWith({
    String? id,
    String? fullname,
    String? email,
    String? phoneNumber,
    String? avatar,
  }) => Editor1(
    id: id ?? this.id,
    fullname: fullname ?? this.fullname,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    avatar: avatar ?? this.avatar,
  );
}

class Creator1 {
  String? id;
  String? fullname;
  String? email;
  String? phoneNumber;
  String? avatar;

  Creator1({this.id, this.fullname, this.email, this.phoneNumber, this.avatar});

  Creator1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    fullname = json["fullname"];
    email = json["email"];
    phoneNumber = json["phone_number"];
    avatar = json["avatar"];
  }

  static List<Creator1> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Creator1.fromJson(map)).toList();
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

  Creator1 copyWith({
    String? id,
    String? fullname,
    String? email,
    String? phoneNumber,
    String? avatar,
  }) => Creator1(
    id: id ?? this.id,
    fullname: fullname ?? this.fullname,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    avatar: avatar ?? this.avatar,
  );
}

class Editor {
  String? id;
  String? fullname;
  String? email;
  String? phoneNumber;
  String? avatar;

  Editor({this.id, this.fullname, this.email, this.phoneNumber, this.avatar});

  Editor.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    fullname = json["fullname"];
    email = json["email"];
    phoneNumber = json["phone_number"];
    avatar = json["avatar"];
  }

  static List<Editor> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Editor.fromJson(map)).toList();
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

  Editor copyWith({
    String? id,
    String? fullname,
    String? email,
    String? phoneNumber,
    String? avatar,
  }) => Editor(
    id: id ?? this.id,
    fullname: fullname ?? this.fullname,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    avatar: avatar ?? this.avatar,
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