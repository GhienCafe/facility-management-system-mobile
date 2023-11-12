class TaskDetailModel {
  int? statusCode;
  String? message;
  Data? data;

  TaskDetailModel({this.statusCode, this.message, this.data});

  TaskDetailModel.fromJson(Map<String, dynamic> json) {
    statusCode = json["status_code"];
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  static List<TaskDetailModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => TaskDetailModel.fromJson(map)).toList();
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

  TaskDetailModel copyWith({
    int? statusCode,
    String? message,
    Data? data,
  }) => TaskDetailModel(
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
  String? assetId;
  String? requestCode;
  String? requestDate;
  String? completionDate;
  int? status;
  StatusObj? statusObj;
  String? description;
  String? notes;
  String? result;
  bool? isInternal;
  String? checkin;
  String? checkout;
  String? assignedTo;
  String? assetTypeId;
  String? categoryId;
  int? priority;
  PriorityObj? priorityObj;
  int? type;
  TypeObj? typeObj;
  String? newAssetId;
  Asset? asset;
  NewAsset? newAsset;
  String? toRoomId;
  ToRoom? toRoom;
  List<Assets>? assets;
  CurrentRoom? currentRoom;
  List<Rooms>? rooms;

  Data({this.id, this.createdAt, this.editedAt, this.creator, this.editor, this.assetId, this.requestCode, this.requestDate, this.completionDate, this.status, this.statusObj, this.description, this.notes, this.result, this.isInternal, this.checkin, this.checkout, this.assignedTo, this.assetTypeId, this.categoryId, this.priority, this.priorityObj, this.type, this.typeObj, this.newAssetId, this.asset, this.newAsset, this.toRoomId, this.toRoom, this.assets, this.currentRoom, this.rooms});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    editedAt = json["edited_at"];
    creator = json["creator"] == null ? null : Creator.fromJson(json["creator"]);
    editor = json["editor"] == null ? null : Editor.fromJson(json["editor"]);
    assetId = json["asset_id"];
    requestCode = json["request_code"];
    requestDate = json["request_date"];
    completionDate = json["completion_date"];
    status = json["status"];
    statusObj = json["status_obj"] == null ? null : StatusObj.fromJson(json["status_obj"]);
    description = json["description"];
    notes = json["notes"];
    result = json["result"];
    isInternal = json["is_internal"];
    checkin = json["checkin"];
    checkout = json["checkout"];
    assignedTo = json["assigned_to"];
    assetTypeId = json["asset_type_id"];
    categoryId = json["category_id"];
    priority = json["priority"];
    priorityObj = json["priority_obj"] == null ? null : PriorityObj.fromJson(json["priority_obj"]);
    type = json["type"];
    typeObj = json["type_obj"] == null ? null : TypeObj.fromJson(json["type_obj"]);
    newAssetId = json["new_asset_id"];
    asset = json["asset"] == null ? null : Asset.fromJson(json["asset"]);
    newAsset = json["new_asset"] == null ? null : NewAsset.fromJson(json["new_asset"]);
    toRoomId = json["to_room_id"];
    toRoom = json["to_room"] == null ? null : ToRoom.fromJson(json["to_room"]);
    assets = json["assets"] == null ? null : (json["assets"] as List).map((e) => Assets.fromJson(e)).toList();
    currentRoom = json["current_room"] == null ? null : CurrentRoom.fromJson(json["current_room"]);
    rooms = json["rooms"] == null ? null : (json["rooms"] as List).map((e) => Rooms.fromJson(e)).toList();
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
    _data["asset_id"] = assetId;
    _data["request_code"] = requestCode;
    _data["request_date"] = requestDate;
    _data["completion_date"] = completionDate;
    _data["status"] = status;
    if(statusObj != null) {
      _data["status_obj"] = statusObj?.toJson();
    }
    _data["description"] = description;
    _data["notes"] = notes;
    _data["result"] = result;
    _data["is_internal"] = isInternal;
    _data["checkin"] = checkin;
    _data["checkout"] = checkout;
    _data["assigned_to"] = assignedTo;
    _data["asset_type_id"] = assetTypeId;
    _data["category_id"] = categoryId;
    _data["priority"] = priority;
    if(priorityObj != null) {
      _data["priority_obj"] = priorityObj?.toJson();
    }
    _data["type"] = type;
    if(typeObj != null) {
      _data["type_obj"] = typeObj?.toJson();
    }
    _data["new_asset_id"] = newAssetId;
    if(asset != null) {
      _data["asset"] = asset?.toJson();
    }
    if(newAsset != null) {
      _data["new_asset"] = newAsset?.toJson();
    }
    _data["to_room_id"] = toRoomId;
    if(toRoom != null) {
      _data["to_room"] = toRoom?.toJson();
    }
    if(assets != null) {
      _data["assets"] = assets?.map((e) => e.toJson()).toList();
    }
    if(currentRoom != null) {
      _data["current_room"] = currentRoom?.toJson();
    }
    if(rooms != null) {
      _data["rooms"] = rooms?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  Data copyWith({
    String? id,
    String? createdAt,
    String? editedAt,
    Creator? creator,
    Editor? editor,
    String? assetId,
    String? requestCode,
    String? requestDate,
    String? completionDate,
    int? status,
    StatusObj? statusObj,
    String? description,
    String? notes,
    String? result,
    bool? isInternal,
    String? checkin,
    String? checkout,
    String? assignedTo,
    String? assetTypeId,
    String? categoryId,
    int? priority,
    PriorityObj? priorityObj,
    int? type,
    TypeObj? typeObj,
    String? newAssetId,
    Asset? asset,
    NewAsset? newAsset,
    String? toRoomId,
    ToRoom? toRoom,
    List<Assets>? assets,
    CurrentRoom? currentRoom,
    List<Rooms>? rooms,
  }) => Data(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    editedAt: editedAt ?? this.editedAt,
    creator: creator ?? this.creator,
    editor: editor ?? this.editor,
    assetId: assetId ?? this.assetId,
    requestCode: requestCode ?? this.requestCode,
    requestDate: requestDate ?? this.requestDate,
    completionDate: completionDate ?? this.completionDate,
    status: status ?? this.status,
    statusObj: statusObj ?? this.statusObj,
    description: description ?? this.description,
    notes: notes ?? this.notes,
    result: result ?? this.result,
    isInternal: isInternal ?? this.isInternal,
    checkin: checkin ?? this.checkin,
    checkout: checkout ?? this.checkout,
    assignedTo: assignedTo ?? this.assignedTo,
    assetTypeId: assetTypeId ?? this.assetTypeId,
    categoryId: categoryId ?? this.categoryId,
    priority: priority ?? this.priority,
    priorityObj: priorityObj ?? this.priorityObj,
    type: type ?? this.type,
    typeObj: typeObj ?? this.typeObj,
    newAssetId: newAssetId ?? this.newAssetId,
    asset: asset ?? this.asset,
    newAsset: newAsset ?? this.newAsset,
    toRoomId: toRoomId ?? this.toRoomId,
    toRoom: toRoom ?? this.toRoom,
    assets: assets ?? this.assets,
    currentRoom: currentRoom ?? this.currentRoom,
    rooms: rooms ?? this.rooms,
  );
}

class Rooms {
  String? id;
  String? roomName;
  int? area;
  String? roomCode;
  String? floorId;
  String? statusId;
  List<Assets1>? assets;

  Rooms({this.id, this.roomName, this.area, this.roomCode, this.floorId, this.statusId, this.assets});

  Rooms.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    roomName = json["room_name"];
    area = json["area"];
    roomCode = json["room_code"];
    floorId = json["floor_id"];
    statusId = json["status_id"];
    assets = json["assets"] == null ? null : (json["assets"] as List).map((e) => Assets1.fromJson(e)).toList();
  }

  static List<Rooms> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Rooms.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["room_name"] = roomName;
    _data["area"] = area;
    _data["room_code"] = roomCode;
    _data["floor_id"] = floorId;
    _data["status_id"] = statusId;
    if(assets != null) {
      _data["assets"] = assets?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  Rooms copyWith({
    String? id,
    String? roomName,
    int? area,
    String? roomCode,
    String? floorId,
    String? statusId,
    List<Assets1>? assets,
  }) => Rooms(
    id: id ?? this.id,
    roomName: roomName ?? this.roomName,
    area: area ?? this.area,
    roomCode: roomCode ?? this.roomCode,
    floorId: floorId ?? this.floorId,
    statusId: statusId ?? this.statusId,
    assets: assets ?? this.assets,
  );
}

class Assets1 {
  String? id;
  String? assetName;
  String? assetCode;
  int? quantity;
  int? status;
  StatusObj4? statusObj;

  Assets1({this.id, this.assetName, this.assetCode, this.quantity, this.status, this.statusObj});

  Assets1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    assetName = json["asset_name"];
    assetCode = json["asset_code"];
    quantity = json["quantity"];
    status = json["status"];
    statusObj = json["status_obj"] == null ? null : StatusObj4.fromJson(json["status_obj"]);
  }

  static List<Assets1> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Assets1.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["asset_name"] = assetName;
    _data["asset_code"] = assetCode;
    _data["quantity"] = quantity;
    _data["status"] = status;
    if(statusObj != null) {
      _data["status_obj"] = statusObj?.toJson();
    }
    return _data;
  }

  Assets1 copyWith({
    String? id,
    String? assetName,
    String? assetCode,
    int? quantity,
    int? status,
    StatusObj4? statusObj,
  }) => Assets1(
    id: id ?? this.id,
    assetName: assetName ?? this.assetName,
    assetCode: assetCode ?? this.assetCode,
    quantity: quantity ?? this.quantity,
    status: status ?? this.status,
    statusObj: statusObj ?? this.statusObj,
  );
}

class StatusObj4 {
  int? value;
  String? name;
  String? displayName;
  String? color;

  StatusObj4({this.value, this.name, this.displayName, this.color});

  StatusObj4.fromJson(Map<String, dynamic> json) {
    value = json["value"];
    name = json["name"];
    displayName = json["display_name"];
    color = json["color"];
  }

  static List<StatusObj4> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => StatusObj4.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["value"] = value;
    _data["name"] = name;
    _data["display_name"] = displayName;
    _data["color"] = color;
    return _data;
  }

  StatusObj4 copyWith({
    int? value,
    String? name,
    String? displayName,
    String? color,
  }) => StatusObj4(
    value: value ?? this.value,
    name: name ?? this.name,
    displayName: displayName ?? this.displayName,
    color: color ?? this.color,
  );
}

class CurrentRoom {
  String? id;
  String? createdAt;
  String? editedAt;
  Creator6? creator;
  Editor6? editor;
  String? roomName;
  int? area;
  String? roomCode;
  String? roomTypeId;
  int? capacity;
  String? statusId;
  String? floorId;
  String? description;

  CurrentRoom({this.id, this.createdAt, this.editedAt, this.creator, this.editor, this.roomName, this.area, this.roomCode, this.roomTypeId, this.capacity, this.statusId, this.floorId, this.description});

  CurrentRoom.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    editedAt = json["edited_at"];
    creator = json["creator"] == null ? null : Creator6.fromJson(json["creator"]);
    editor = json["editor"] == null ? null : Editor6.fromJson(json["editor"]);
    roomName = json["room_name"];
    area = json["area"];
    roomCode = json["room_code"];
    roomTypeId = json["room_type_id"];
    capacity = json["capacity"];
    statusId = json["status_id"];
    floorId = json["floor_id"];
    description = json["description"];
  }

  static List<CurrentRoom> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => CurrentRoom.fromJson(map)).toList();
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
    _data["room_code"] = roomCode;
    _data["room_type_id"] = roomTypeId;
    _data["capacity"] = capacity;
    _data["status_id"] = statusId;
    _data["floor_id"] = floorId;
    _data["description"] = description;
    return _data;
  }

  CurrentRoom copyWith({
    String? id,
    String? createdAt,
    String? editedAt,
    Creator6? creator,
    Editor6? editor,
    String? roomName,
    int? area,
    String? roomCode,
    String? roomTypeId,
    int? capacity,
    String? statusId,
    String? floorId,
    String? description,
  }) => CurrentRoom(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    editedAt: editedAt ?? this.editedAt,
    creator: creator ?? this.creator,
    editor: editor ?? this.editor,
    roomName: roomName ?? this.roomName,
    area: area ?? this.area,
    roomCode: roomCode ?? this.roomCode,
    roomTypeId: roomTypeId ?? this.roomTypeId,
    capacity: capacity ?? this.capacity,
    statusId: statusId ?? this.statusId,
    floorId: floorId ?? this.floorId,
    description: description ?? this.description,
  );
}

class Editor6 {
  String? id;
  String? fullname;
  String? email;
  String? phoneNumber;
  String? avatar;

  Editor6({this.id, this.fullname, this.email, this.phoneNumber, this.avatar});

  Editor6.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    fullname = json["fullname"];
    email = json["email"];
    phoneNumber = json["phone_number"];
    avatar = json["avatar"];
  }

  static List<Editor6> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Editor6.fromJson(map)).toList();
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

  Editor6 copyWith({
    String? id,
    String? fullname,
    String? email,
    String? phoneNumber,
    String? avatar,
  }) => Editor6(
    id: id ?? this.id,
    fullname: fullname ?? this.fullname,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    avatar: avatar ?? this.avatar,
  );
}

class Creator6 {
  String? id;
  String? fullname;
  String? email;
  String? phoneNumber;
  String? avatar;

  Creator6({this.id, this.fullname, this.email, this.phoneNumber, this.avatar});

  Creator6.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    fullname = json["fullname"];
    email = json["email"];
    phoneNumber = json["phone_number"];
    avatar = json["avatar"];
  }

  static List<Creator6> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Creator6.fromJson(map)).toList();
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

  Creator6 copyWith({
    String? id,
    String? fullname,
    String? email,
    String? phoneNumber,
    String? avatar,
  }) => Creator6(
    id: id ?? this.id,
    fullname: fullname ?? this.fullname,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    avatar: avatar ?? this.avatar,
  );
}

class Assets {
  int? quantity;
  FromRoom? fromRoom;
  Asset1? asset;

  Assets({this.quantity, this.fromRoom, this.asset});

  Assets.fromJson(Map<String, dynamic> json) {
    quantity = json["quantity"];
    fromRoom = json["from_room"] == null ? null : FromRoom.fromJson(json["from_room"]);
    asset = json["asset"] == null ? null : Asset1.fromJson(json["asset"]);
  }

  static List<Assets> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Assets.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["quantity"] = quantity;
    if(fromRoom != null) {
      _data["from_room"] = fromRoom?.toJson();
    }
    if(asset != null) {
      _data["asset"] = asset?.toJson();
    }
    return _data;
  }

  Assets copyWith({
    int? quantity,
    FromRoom? fromRoom,
    Asset1? asset,
  }) => Assets(
    quantity: quantity ?? this.quantity,
    fromRoom: fromRoom ?? this.fromRoom,
    asset: asset ?? this.asset,
  );
}

class Asset1 {
  String? id;
  String? createdAt;
  String? editedAt;
  Creator5? creator;
  Editor5? editor;
  String? assetName;
  String? assetCode;
  bool? isMovable;
  int? status;
  StatusObj3? statusObj;
  int? manufacturingYear;
  String? serialNumber;
  int? quantity;
  String? description;
  String? lastMaintenanceTime;
  String? typeId;
  String? modelId;
  String? imageUrl;
  bool? isRented;
  String? lastCheckedDate;
  String? startDateOfUse;

  Asset1({this.id, this.createdAt, this.editedAt, this.creator, this.editor, this.assetName, this.assetCode, this.isMovable, this.status, this.statusObj, this.manufacturingYear, this.serialNumber, this.quantity, this.description, this.lastMaintenanceTime, this.typeId, this.modelId, this.imageUrl, this.isRented, this.lastCheckedDate, this.startDateOfUse});

  Asset1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    editedAt = json["edited_at"];
    creator = json["creator"] == null ? null : Creator5.fromJson(json["creator"]);
    editor = json["editor"] == null ? null : Editor5.fromJson(json["editor"]);
    assetName = json["asset_name"];
    assetCode = json["asset_code"];
    isMovable = json["is_movable"];
    status = json["status"];
    statusObj = json["status_obj"] == null ? null : StatusObj3.fromJson(json["status_obj"]);
    manufacturingYear = json["manufacturing_year"];
    serialNumber = json["serial_number"];
    quantity = json["quantity"];
    description = json["description"];
    lastMaintenanceTime = json["last_maintenance_time"];
    typeId = json["type_id"];
    modelId = json["model_id"];
    imageUrl = json["image_url"];
    isRented = json["is_rented"];
    lastCheckedDate = json["last_checked_date"];
    startDateOfUse = json["start_date_of_use"];
  }

  static List<Asset1> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Asset1.fromJson(map)).toList();
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
    _data["asset_name"] = assetName;
    _data["asset_code"] = assetCode;
    _data["is_movable"] = isMovable;
    _data["status"] = status;
    if(statusObj != null) {
      _data["status_obj"] = statusObj?.toJson();
    }
    _data["manufacturing_year"] = manufacturingYear;
    _data["serial_number"] = serialNumber;
    _data["quantity"] = quantity;
    _data["description"] = description;
    _data["last_maintenance_time"] = lastMaintenanceTime;
    _data["type_id"] = typeId;
    _data["model_id"] = modelId;
    _data["image_url"] = imageUrl;
    _data["is_rented"] = isRented;
    _data["last_checked_date"] = lastCheckedDate;
    _data["start_date_of_use"] = startDateOfUse;
    return _data;
  }

  Asset1 copyWith({
    String? id,
    String? createdAt,
    String? editedAt,
    Creator5? creator,
    Editor5? editor,
    String? assetName,
    String? assetCode,
    bool? isMovable,
    int? status,
    StatusObj3? statusObj,
    int? manufacturingYear,
    String? serialNumber,
    int? quantity,
    String? description,
    String? lastMaintenanceTime,
    String? typeId,
    String? modelId,
    String? imageUrl,
    bool? isRented,
    String? lastCheckedDate,
    String? startDateOfUse,
  }) => Asset1(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    editedAt: editedAt ?? this.editedAt,
    creator: creator ?? this.creator,
    editor: editor ?? this.editor,
    assetName: assetName ?? this.assetName,
    assetCode: assetCode ?? this.assetCode,
    isMovable: isMovable ?? this.isMovable,
    status: status ?? this.status,
    statusObj: statusObj ?? this.statusObj,
    manufacturingYear: manufacturingYear ?? this.manufacturingYear,
    serialNumber: serialNumber ?? this.serialNumber,
    quantity: quantity ?? this.quantity,
    description: description ?? this.description,
    lastMaintenanceTime: lastMaintenanceTime ?? this.lastMaintenanceTime,
    typeId: typeId ?? this.typeId,
    modelId: modelId ?? this.modelId,
    imageUrl: imageUrl ?? this.imageUrl,
    isRented: isRented ?? this.isRented,
    lastCheckedDate: lastCheckedDate ?? this.lastCheckedDate,
    startDateOfUse: startDateOfUse ?? this.startDateOfUse,
  );
}

class StatusObj3 {
  int? value;
  String? name;
  String? displayName;
  String? color;

  StatusObj3({this.value, this.name, this.displayName, this.color});

  StatusObj3.fromJson(Map<String, dynamic> json) {
    value = json["value"];
    name = json["name"];
    displayName = json["display_name"];
    color = json["color"];
  }

  static List<StatusObj3> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => StatusObj3.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["value"] = value;
    _data["name"] = name;
    _data["display_name"] = displayName;
    _data["color"] = color;
    return _data;
  }

  StatusObj3 copyWith({
    int? value,
    String? name,
    String? displayName,
    String? color,
  }) => StatusObj3(
    value: value ?? this.value,
    name: name ?? this.name,
    displayName: displayName ?? this.displayName,
    color: color ?? this.color,
  );
}

class Editor5 {
  String? id;
  String? fullname;
  String? email;
  String? phoneNumber;
  String? avatar;

  Editor5({this.id, this.fullname, this.email, this.phoneNumber, this.avatar});

  Editor5.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    fullname = json["fullname"];
    email = json["email"];
    phoneNumber = json["phone_number"];
    avatar = json["avatar"];
  }

  static List<Editor5> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Editor5.fromJson(map)).toList();
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

  Editor5 copyWith({
    String? id,
    String? fullname,
    String? email,
    String? phoneNumber,
    String? avatar,
  }) => Editor5(
    id: id ?? this.id,
    fullname: fullname ?? this.fullname,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    avatar: avatar ?? this.avatar,
  );
}

class Creator5 {
  String? id;
  String? fullname;
  String? email;
  String? phoneNumber;
  String? avatar;

  Creator5({this.id, this.fullname, this.email, this.phoneNumber, this.avatar});

  Creator5.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    fullname = json["fullname"];
    email = json["email"];
    phoneNumber = json["phone_number"];
    avatar = json["avatar"];
  }

  static List<Creator5> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Creator5.fromJson(map)).toList();
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

  Creator5 copyWith({
    String? id,
    String? fullname,
    String? email,
    String? phoneNumber,
    String? avatar,
  }) => Creator5(
    id: id ?? this.id,
    fullname: fullname ?? this.fullname,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    avatar: avatar ?? this.avatar,
  );
}

class FromRoom {
  String? id;
  String? createdAt;
  String? editedAt;
  Creator4? creator;
  Editor4? editor;
  String? roomName;
  int? area;
  String? roomCode;
  String? roomTypeId;
  int? capacity;
  String? statusId;
  String? floorId;
  String? description;

  FromRoom({this.id, this.createdAt, this.editedAt, this.creator, this.editor, this.roomName, this.area, this.roomCode, this.roomTypeId, this.capacity, this.statusId, this.floorId, this.description});

  FromRoom.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    editedAt = json["edited_at"];
    creator = json["creator"] == null ? null : Creator4.fromJson(json["creator"]);
    editor = json["editor"] == null ? null : Editor4.fromJson(json["editor"]);
    roomName = json["room_name"];
    area = json["area"];
    roomCode = json["room_code"];
    roomTypeId = json["room_type_id"];
    capacity = json["capacity"];
    statusId = json["status_id"];
    floorId = json["floor_id"];
    description = json["description"];
  }

  static List<FromRoom> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => FromRoom.fromJson(map)).toList();
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
    _data["room_code"] = roomCode;
    _data["room_type_id"] = roomTypeId;
    _data["capacity"] = capacity;
    _data["status_id"] = statusId;
    _data["floor_id"] = floorId;
    _data["description"] = description;
    return _data;
  }

  FromRoom copyWith({
    String? id,
    String? createdAt,
    String? editedAt,
    Creator4? creator,
    Editor4? editor,
    String? roomName,
    int? area,
    String? roomCode,
    String? roomTypeId,
    int? capacity,
    String? statusId,
    String? floorId,
    String? description,
  }) => FromRoom(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    editedAt: editedAt ?? this.editedAt,
    creator: creator ?? this.creator,
    editor: editor ?? this.editor,
    roomName: roomName ?? this.roomName,
    area: area ?? this.area,
    roomCode: roomCode ?? this.roomCode,
    roomTypeId: roomTypeId ?? this.roomTypeId,
    capacity: capacity ?? this.capacity,
    statusId: statusId ?? this.statusId,
    floorId: floorId ?? this.floorId,
    description: description ?? this.description,
  );
}

class Editor4 {
  String? id;
  String? fullname;
  String? email;
  String? phoneNumber;
  String? avatar;

  Editor4({this.id, this.fullname, this.email, this.phoneNumber, this.avatar});

  Editor4.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    fullname = json["fullname"];
    email = json["email"];
    phoneNumber = json["phone_number"];
    avatar = json["avatar"];
  }

  static List<Editor4> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Editor4.fromJson(map)).toList();
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

  Editor4 copyWith({
    String? id,
    String? fullname,
    String? email,
    String? phoneNumber,
    String? avatar,
  }) => Editor4(
    id: id ?? this.id,
    fullname: fullname ?? this.fullname,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    avatar: avatar ?? this.avatar,
  );
}

class Creator4 {
  String? id;
  String? fullname;
  String? email;
  String? phoneNumber;
  String? avatar;

  Creator4({this.id, this.fullname, this.email, this.phoneNumber, this.avatar});

  Creator4.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    fullname = json["fullname"];
    email = json["email"];
    phoneNumber = json["phone_number"];
    avatar = json["avatar"];
  }

  static List<Creator4> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Creator4.fromJson(map)).toList();
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

  Creator4 copyWith({
    String? id,
    String? fullname,
    String? email,
    String? phoneNumber,
    String? avatar,
  }) => Creator4(
    id: id ?? this.id,
    fullname: fullname ?? this.fullname,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    avatar: avatar ?? this.avatar,
  );
}

class ToRoom {
  String? id;
  String? createdAt;
  String? editedAt;
  Creator3? creator;
  Editor3? editor;
  String? roomName;
  int? area;
  String? roomCode;
  String? roomTypeId;
  int? capacity;
  String? statusId;
  String? floorId;
  String? description;

  ToRoom({this.id, this.createdAt, this.editedAt, this.creator, this.editor, this.roomName, this.area, this.roomCode, this.roomTypeId, this.capacity, this.statusId, this.floorId, this.description});

  ToRoom.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    editedAt = json["edited_at"];
    creator = json["creator"] == null ? null : Creator3.fromJson(json["creator"]);
    editor = json["editor"] == null ? null : Editor3.fromJson(json["editor"]);
    roomName = json["room_name"];
    area = json["area"];
    roomCode = json["room_code"];
    roomTypeId = json["room_type_id"];
    capacity = json["capacity"];
    statusId = json["status_id"];
    floorId = json["floor_id"];
    description = json["description"];
  }

  static List<ToRoom> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => ToRoom.fromJson(map)).toList();
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
    _data["room_code"] = roomCode;
    _data["room_type_id"] = roomTypeId;
    _data["capacity"] = capacity;
    _data["status_id"] = statusId;
    _data["floor_id"] = floorId;
    _data["description"] = description;
    return _data;
  }

  ToRoom copyWith({
    String? id,
    String? createdAt,
    String? editedAt,
    Creator3? creator,
    Editor3? editor,
    String? roomName,
    int? area,
    String? roomCode,
    String? roomTypeId,
    int? capacity,
    String? statusId,
    String? floorId,
    String? description,
  }) => ToRoom(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    editedAt: editedAt ?? this.editedAt,
    creator: creator ?? this.creator,
    editor: editor ?? this.editor,
    roomName: roomName ?? this.roomName,
    area: area ?? this.area,
    roomCode: roomCode ?? this.roomCode,
    roomTypeId: roomTypeId ?? this.roomTypeId,
    capacity: capacity ?? this.capacity,
    statusId: statusId ?? this.statusId,
    floorId: floorId ?? this.floorId,
    description: description ?? this.description,
  );
}

class Editor3 {
  String? id;
  String? fullname;
  String? email;
  String? phoneNumber;
  String? avatar;

  Editor3({this.id, this.fullname, this.email, this.phoneNumber, this.avatar});

  Editor3.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    fullname = json["fullname"];
    email = json["email"];
    phoneNumber = json["phone_number"];
    avatar = json["avatar"];
  }

  static List<Editor3> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Editor3.fromJson(map)).toList();
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

  Editor3 copyWith({
    String? id,
    String? fullname,
    String? email,
    String? phoneNumber,
    String? avatar,
  }) => Editor3(
    id: id ?? this.id,
    fullname: fullname ?? this.fullname,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    avatar: avatar ?? this.avatar,
  );
}

class Creator3 {
  String? id;
  String? fullname;
  String? email;
  String? phoneNumber;
  String? avatar;

  Creator3({this.id, this.fullname, this.email, this.phoneNumber, this.avatar});

  Creator3.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    fullname = json["fullname"];
    email = json["email"];
    phoneNumber = json["phone_number"];
    avatar = json["avatar"];
  }

  static List<Creator3> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Creator3.fromJson(map)).toList();
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

  Creator3 copyWith({
    String? id,
    String? fullname,
    String? email,
    String? phoneNumber,
    String? avatar,
  }) => Creator3(
    id: id ?? this.id,
    fullname: fullname ?? this.fullname,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    avatar: avatar ?? this.avatar,
  );
}

class NewAsset {
  String? id;
  String? createdAt;
  String? editedAt;
  Creator2? creator;
  Editor2? editor;
  String? assetName;
  String? assetCode;
  bool? isMovable;
  int? status;
  StatusObj2? statusObj;
  int? manufacturingYear;
  String? serialNumber;
  int? quantity;
  String? description;
  String? lastMaintenanceTime;
  String? typeId;
  String? modelId;
  String? imageUrl;
  bool? isRented;
  String? lastCheckedDate;
  String? startDateOfUse;

  NewAsset({this.id, this.createdAt, this.editedAt, this.creator, this.editor, this.assetName, this.assetCode, this.isMovable, this.status, this.statusObj, this.manufacturingYear, this.serialNumber, this.quantity, this.description, this.lastMaintenanceTime, this.typeId, this.modelId, this.imageUrl, this.isRented, this.lastCheckedDate, this.startDateOfUse});

  NewAsset.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    editedAt = json["edited_at"];
    creator = json["creator"] == null ? null : Creator2.fromJson(json["creator"]);
    editor = json["editor"] == null ? null : Editor2.fromJson(json["editor"]);
    assetName = json["asset_name"];
    assetCode = json["asset_code"];
    isMovable = json["is_movable"];
    status = json["status"];
    statusObj = json["status_obj"] == null ? null : StatusObj2.fromJson(json["status_obj"]);
    manufacturingYear = json["manufacturing_year"];
    serialNumber = json["serial_number"];
    quantity = json["quantity"];
    description = json["description"];
    lastMaintenanceTime = json["last_maintenance_time"];
    typeId = json["type_id"];
    modelId = json["model_id"];
    imageUrl = json["image_url"];
    isRented = json["is_rented"];
    lastCheckedDate = json["last_checked_date"];
    startDateOfUse = json["start_date_of_use"];
  }

  static List<NewAsset> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => NewAsset.fromJson(map)).toList();
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
    _data["asset_name"] = assetName;
    _data["asset_code"] = assetCode;
    _data["is_movable"] = isMovable;
    _data["status"] = status;
    if(statusObj != null) {
      _data["status_obj"] = statusObj?.toJson();
    }
    _data["manufacturing_year"] = manufacturingYear;
    _data["serial_number"] = serialNumber;
    _data["quantity"] = quantity;
    _data["description"] = description;
    _data["last_maintenance_time"] = lastMaintenanceTime;
    _data["type_id"] = typeId;
    _data["model_id"] = modelId;
    _data["image_url"] = imageUrl;
    _data["is_rented"] = isRented;
    _data["last_checked_date"] = lastCheckedDate;
    _data["start_date_of_use"] = startDateOfUse;
    return _data;
  }

  NewAsset copyWith({
    String? id,
    String? createdAt,
    String? editedAt,
    Creator2? creator,
    Editor2? editor,
    String? assetName,
    String? assetCode,
    bool? isMovable,
    int? status,
    StatusObj2? statusObj,
    int? manufacturingYear,
    String? serialNumber,
    int? quantity,
    String? description,
    String? lastMaintenanceTime,
    String? typeId,
    String? modelId,
    String? imageUrl,
    bool? isRented,
    String? lastCheckedDate,
    String? startDateOfUse,
  }) => NewAsset(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    editedAt: editedAt ?? this.editedAt,
    creator: creator ?? this.creator,
    editor: editor ?? this.editor,
    assetName: assetName ?? this.assetName,
    assetCode: assetCode ?? this.assetCode,
    isMovable: isMovable ?? this.isMovable,
    status: status ?? this.status,
    statusObj: statusObj ?? this.statusObj,
    manufacturingYear: manufacturingYear ?? this.manufacturingYear,
    serialNumber: serialNumber ?? this.serialNumber,
    quantity: quantity ?? this.quantity,
    description: description ?? this.description,
    lastMaintenanceTime: lastMaintenanceTime ?? this.lastMaintenanceTime,
    typeId: typeId ?? this.typeId,
    modelId: modelId ?? this.modelId,
    imageUrl: imageUrl ?? this.imageUrl,
    isRented: isRented ?? this.isRented,
    lastCheckedDate: lastCheckedDate ?? this.lastCheckedDate,
    startDateOfUse: startDateOfUse ?? this.startDateOfUse,
  );
}

class StatusObj2 {
  int? value;
  String? name;
  String? displayName;
  String? color;

  StatusObj2({this.value, this.name, this.displayName, this.color});

  StatusObj2.fromJson(Map<String, dynamic> json) {
    value = json["value"];
    name = json["name"];
    displayName = json["display_name"];
    color = json["color"];
  }

  static List<StatusObj2> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => StatusObj2.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["value"] = value;
    _data["name"] = name;
    _data["display_name"] = displayName;
    _data["color"] = color;
    return _data;
  }

  StatusObj2 copyWith({
    int? value,
    String? name,
    String? displayName,
    String? color,
  }) => StatusObj2(
    value: value ?? this.value,
    name: name ?? this.name,
    displayName: displayName ?? this.displayName,
    color: color ?? this.color,
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

class Asset {
  String? id;
  String? createdAt;
  String? editedAt;
  Creator1? creator;
  Editor1? editor;
  String? assetName;
  String? assetCode;
  bool? isMovable;
  int? status;
  StatusObj1? statusObj;
  int? manufacturingYear;
  String? serialNumber;
  int? quantity;
  String? description;
  String? lastMaintenanceTime;
  String? typeId;
  String? modelId;
  String? imageUrl;
  bool? isRented;
  String? lastCheckedDate;
  String? startDateOfUse;

  Asset({this.id, this.createdAt, this.editedAt, this.creator, this.editor, this.assetName, this.assetCode, this.isMovable, this.status, this.statusObj, this.manufacturingYear, this.serialNumber, this.quantity, this.description, this.lastMaintenanceTime, this.typeId, this.modelId, this.imageUrl, this.isRented, this.lastCheckedDate, this.startDateOfUse});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    editedAt = json["edited_at"];
    creator = json["creator"] == null ? null : Creator1.fromJson(json["creator"]);
    editor = json["editor"] == null ? null : Editor1.fromJson(json["editor"]);
    assetName = json["asset_name"];
    assetCode = json["asset_code"];
    isMovable = json["is_movable"];
    status = json["status"];
    statusObj = json["status_obj"] == null ? null : StatusObj1.fromJson(json["status_obj"]);
    manufacturingYear = json["manufacturing_year"];
    serialNumber = json["serial_number"];
    quantity = json["quantity"];
    description = json["description"];
    lastMaintenanceTime = json["last_maintenance_time"];
    typeId = json["type_id"];
    modelId = json["model_id"];
    imageUrl = json["image_url"];
    isRented = json["is_rented"];
    lastCheckedDate = json["last_checked_date"];
    startDateOfUse = json["start_date_of_use"];
  }

  static List<Asset> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Asset.fromJson(map)).toList();
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
    _data["asset_name"] = assetName;
    _data["asset_code"] = assetCode;
    _data["is_movable"] = isMovable;
    _data["status"] = status;
    if(statusObj != null) {
      _data["status_obj"] = statusObj?.toJson();
    }
    _data["manufacturing_year"] = manufacturingYear;
    _data["serial_number"] = serialNumber;
    _data["quantity"] = quantity;
    _data["description"] = description;
    _data["last_maintenance_time"] = lastMaintenanceTime;
    _data["type_id"] = typeId;
    _data["model_id"] = modelId;
    _data["image_url"] = imageUrl;
    _data["is_rented"] = isRented;
    _data["last_checked_date"] = lastCheckedDate;
    _data["start_date_of_use"] = startDateOfUse;
    return _data;
  }

  Asset copyWith({
    String? id,
    String? createdAt,
    String? editedAt,
    Creator1? creator,
    Editor1? editor,
    String? assetName,
    String? assetCode,
    bool? isMovable,
    int? status,
    StatusObj1? statusObj,
    int? manufacturingYear,
    String? serialNumber,
    int? quantity,
    String? description,
    String? lastMaintenanceTime,
    String? typeId,
    String? modelId,
    String? imageUrl,
    bool? isRented,
    String? lastCheckedDate,
    String? startDateOfUse,
  }) => Asset(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    editedAt: editedAt ?? this.editedAt,
    creator: creator ?? this.creator,
    editor: editor ?? this.editor,
    assetName: assetName ?? this.assetName,
    assetCode: assetCode ?? this.assetCode,
    isMovable: isMovable ?? this.isMovable,
    status: status ?? this.status,
    statusObj: statusObj ?? this.statusObj,
    manufacturingYear: manufacturingYear ?? this.manufacturingYear,
    serialNumber: serialNumber ?? this.serialNumber,
    quantity: quantity ?? this.quantity,
    description: description ?? this.description,
    lastMaintenanceTime: lastMaintenanceTime ?? this.lastMaintenanceTime,
    typeId: typeId ?? this.typeId,
    modelId: modelId ?? this.modelId,
    imageUrl: imageUrl ?? this.imageUrl,
    isRented: isRented ?? this.isRented,
    lastCheckedDate: lastCheckedDate ?? this.lastCheckedDate,
    startDateOfUse: startDateOfUse ?? this.startDateOfUse,
  );
}

class StatusObj1 {
  int? value;
  String? name;
  String? displayName;
  String? color;

  StatusObj1({this.value, this.name, this.displayName, this.color});

  StatusObj1.fromJson(Map<String, dynamic> json) {
    value = json["value"];
    name = json["name"];
    displayName = json["display_name"];
    color = json["color"];
  }

  static List<StatusObj1> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => StatusObj1.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["value"] = value;
    _data["name"] = name;
    _data["display_name"] = displayName;
    _data["color"] = color;
    return _data;
  }

  StatusObj1 copyWith({
    int? value,
    String? name,
    String? displayName,
    String? color,
  }) => StatusObj1(
    value: value ?? this.value,
    name: name ?? this.name,
    displayName: displayName ?? this.displayName,
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

class TypeObj {
  int? value;
  String? name;
  String? displayName;
  String? color;

  TypeObj({this.value, this.name, this.displayName, this.color});

  TypeObj.fromJson(Map<String, dynamic> json) {
    value = json["value"];
    name = json["name"];
    displayName = json["display_name"];
    color = json["color"];
  }

  static List<TypeObj> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => TypeObj.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["value"] = value;
    _data["name"] = name;
    _data["display_name"] = displayName;
    _data["color"] = color;
    return _data;
  }

  TypeObj copyWith({
    int? value,
    String? name,
    String? displayName,
    String? color,
  }) => TypeObj(
    value: value ?? this.value,
    name: name ?? this.name,
    displayName: displayName ?? this.displayName,
    color: color ?? this.color,
  );
}

class PriorityObj {
  int? value;
  String? name;
  String? displayName;
  String? color;

  PriorityObj({this.value, this.name, this.displayName, this.color});

  PriorityObj.fromJson(Map<String, dynamic> json) {
    value = json["value"];
    name = json["name"];
    displayName = json["display_name"];
    color = json["color"];
  }

  static List<PriorityObj> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => PriorityObj.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["value"] = value;
    _data["name"] = name;
    _data["display_name"] = displayName;
    _data["color"] = color;
    return _data;
  }

  PriorityObj copyWith({
    int? value,
    String? name,
    String? displayName,
    String? color,
  }) => PriorityObj(
    value: value ?? this.value,
    name: name ?? this.name,
    displayName: displayName ?? this.displayName,
    color: color ?? this.color,
  );
}

class StatusObj {
  int? value;
  String? name;
  String? displayName;
  String? color;

  StatusObj({this.value, this.name, this.displayName, this.color});

  StatusObj.fromJson(Map<String, dynamic> json) {
    value = json["value"];
    name = json["name"];
    displayName = json["display_name"];
    color = json["color"];
  }

  static List<StatusObj> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => StatusObj.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["value"] = value;
    _data["name"] = name;
    _data["display_name"] = displayName;
    _data["color"] = color;
    return _data;
  }

  StatusObj copyWith({
    int? value,
    String? name,
    String? displayName,
    String? color,
  }) => StatusObj(
    value: value ?? this.value,
    name: name ?? this.name,
    displayName: displayName ?? this.displayName,
    color: color ?? this.color,
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