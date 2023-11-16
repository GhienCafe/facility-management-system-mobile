class Rooms {
  String? id;
  String? roomName;
  int? area;
  String? roomCode;
  String? floorId;
  String? statusId;
  Status? status;
  List<Assets>? assets;

  Rooms({this.id, this.roomName, this.area, this.roomCode, this.floorId, this.statusId, this.status, this.assets});

  Rooms.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    roomName = json["room_name"];
    area = json["area"];
    roomCode = json["room_code"];
    floorId = json["floor_id"];
    statusId = json["status_id"];
    status = json["status"] == null ? null : Status.fromJson(json["status"]);
    assets = json["assets"] == null ? null : (json["assets"] as List).map((e) => Assets.fromJson(e)).toList();
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
    if(status != null) {
      _data["status"] = status?.toJson();
    }
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
    Status? status,
    List<Assets>? assets,
  }) => Rooms(
    id: id ?? this.id,
    roomName: roomName ?? this.roomName,
    area: area ?? this.area,
    roomCode: roomCode ?? this.roomCode,
    floorId: floorId ?? this.floorId,
    statusId: statusId ?? this.statusId,
    status: status ?? this.status,
    assets: assets ?? this.assets,
  );
}

class Assets {
  String? id;
  String? assetName;
  String? assetCode;
  int? quantityReported;
  int? quantityBefore;
  int? statusBefore;
  StatusBeforeObj? statusBeforeObj;
  int? statusReported;
  StatusReportedObj? statusReportedObj;

  Assets({this.id, this.assetName, this.assetCode, this.quantityReported, this.quantityBefore, this.statusBefore, this.statusBeforeObj, this.statusReported, this.statusReportedObj});

  Assets.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    assetName = json["asset_name"];
    assetCode = json["asset_code"];
    quantityReported = json["quantity_reported"];
    quantityBefore = json["quantity_before"];
    statusBefore = json["status_before"];
    statusBeforeObj = json["status_before_obj"] == null ? null : StatusBeforeObj.fromJson(json["status_before_obj"]);
    statusReported = json["status_reported"];
    statusReportedObj = json["status_reported_obj"] == null ? null : StatusReportedObj.fromJson(json["status_reported_obj"]);
  }

  static List<Assets> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Assets.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["asset_name"] = assetName;
    _data["asset_code"] = assetCode;
    _data["quantity_reported"] = quantityReported;
    _data["quantity_before"] = quantityBefore;
    _data["status_before"] = statusBefore;
    if(statusBeforeObj != null) {
      _data["status_before_obj"] = statusBeforeObj?.toJson();
    }
    _data["status_reported"] = statusReported;
    if(statusReportedObj != null) {
      _data["status_reported_obj"] = statusReportedObj?.toJson();
    }
    return _data;
  }

  Assets copyWith({
    String? id,
    String? assetName,
    String? assetCode,
    int? quantityReported,
    int? quantityBefore,
    int? statusBefore,
    StatusBeforeObj? statusBeforeObj,
    int? statusReported,
    StatusReportedObj? statusReportedObj,
  }) => Assets(
    id: id ?? this.id,
    assetName: assetName ?? this.assetName,
    assetCode: assetCode ?? this.assetCode,
    quantityReported: quantityReported ?? this.quantityReported,
    quantityBefore: quantityBefore ?? this.quantityBefore,
    statusBefore: statusBefore ?? this.statusBefore,
    statusBeforeObj: statusBeforeObj ?? this.statusBeforeObj,
    statusReported: statusReported ?? this.statusReported,
    statusReportedObj: statusReportedObj ?? this.statusReportedObj,
  );
}

class StatusReportedObj {
  int? value;
  String? name;
  String? displayName;
  String? color;

  StatusReportedObj({this.value, this.name, this.displayName, this.color});

  StatusReportedObj.fromJson(Map<String, dynamic> json) {
    value = json["value"];
    name = json["name"];
    displayName = json["display_name"];
    color = json["color"];
  }

  static List<StatusReportedObj> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => StatusReportedObj.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["value"] = value;
    _data["name"] = name;
    _data["display_name"] = displayName;
    _data["color"] = color;
    return _data;
  }

  StatusReportedObj copyWith({
    int? value,
    String? name,
    String? displayName,
    String? color,
  }) => StatusReportedObj(
    value: value ?? this.value,
    name: name ?? this.name,
    displayName: displayName ?? this.displayName,
    color: color ?? this.color,
  );
}

class StatusBeforeObj {
  int? value;
  String? name;
  String? displayName;
  String? color;

  StatusBeforeObj({this.value, this.name, this.displayName, this.color});

  StatusBeforeObj.fromJson(Map<String, dynamic> json) {
    value = json["value"];
    name = json["name"];
    displayName = json["display_name"];
    color = json["color"];
  }

  static List<StatusBeforeObj> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => StatusBeforeObj.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["value"] = value;
    _data["name"] = name;
    _data["display_name"] = displayName;
    _data["color"] = color;
    return _data;
  }

  StatusBeforeObj copyWith({
    int? value,
    String? name,
    String? displayName,
    String? color,
  }) => StatusBeforeObj(
    value: value ?? this.value,
    name: name ?? this.name,
    displayName: displayName ?? this.displayName,
    color: color ?? this.color,
  );
}

class Status {
  String? statusName;
  String? description;
  String? color;

  Status({this.statusName, this.description, this.color});

  Status.fromJson(Map<String, dynamic> json) {
    statusName = json["status_name"];
    description = json["description"];
    color = json["color"];
  }

  static List<Status> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Status.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status_name"] = statusName;
    _data["description"] = description;
    _data["color"] = color;
    return _data;
  }

  Status copyWith({
    String? statusName,
    String? description,
    String? color,
  }) => Status(
    statusName: statusName ?? this.statusName,
    description: description ?? this.description,
    color: color ?? this.color,
  );
}