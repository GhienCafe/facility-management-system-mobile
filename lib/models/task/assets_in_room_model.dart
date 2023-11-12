class Rooms {
  String? id;
  String? roomName;
  int? area;
  String? roomCode;
  String? floorId;
  String? statusId;
  List<Assets>? assets;

  Rooms({this.id, this.roomName, this.area, this.roomCode, this.floorId, this.statusId, this.assets});

  Rooms.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    roomName = json["room_name"];
    area = json["area"];
    roomCode = json["room_code"];
    floorId = json["floor_id"];
    statusId = json["status_id"];
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
    List<Assets>? assets,
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

class Assets {
  String? id;
  String? assetName;
  String? assetCode;
  int? quantity;
  int? status;
  StatusObj? statusObj;

  Assets({this.id, this.assetName, this.assetCode, this.quantity, this.status, this.statusObj});

  Assets.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    assetName = json["asset_name"];
    assetCode = json["asset_code"];
    quantity = json["quantity"];
    status = json["status"];
    statusObj = json["status_obj"] == null ? null : StatusObj.fromJson(json["status_obj"]);
  }

  static List<Assets> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Assets.fromJson(map)).toList();
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

  Assets copyWith({
    String? id,
    String? assetName,
    String? assetCode,
    int? quantity,
    int? status,
    StatusObj? statusObj,
  }) => Assets(
    id: id ?? this.id,
    assetName: assetName ?? this.assetName,
    assetCode: assetCode ?? this.assetCode,
    quantity: quantity ?? this.quantity,
    status: status ?? this.status,
    statusObj: statusObj ?? this.statusObj,
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