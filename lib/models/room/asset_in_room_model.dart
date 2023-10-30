class AssetInRoomModel {
  int? totalCount;
  int? pageSize;
  int? page;
  int? totalPages;
  List<Data>? data;
  int? statusCode;
  String? message;

  AssetInRoomModel({this.totalCount, this.pageSize, this.page, this.totalPages, this.data, this.statusCode, this.message});

  AssetInRoomModel.fromJson(Map<String, dynamic> json) {
    totalCount = json["total_count"];
    pageSize = json["page_size"];
    page = json["page"];
    totalPages = json["total_pages"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    statusCode = json["status_code"];
    message = json["message"];
  }

  static List<AssetInRoomModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => AssetInRoomModel.fromJson(map)).toList();
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

  AssetInRoomModel copyWith({
    int? totalCount,
    int? pageSize,
    int? page,
    int? totalPages,
    List<Data>? data,
    int? statusCode,
    String? message,
  }) => AssetInRoomModel(
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
  int? status;
  StatusObj? statusObj;
  int? quantity;
  String? fromDate;
  Asset? asset;
  String? id;
  String? createdAt;
  String? editedAt;
  Creator? creator;

  Data({this.status, this.statusObj, this.quantity, this.fromDate, this.asset, this.id, this.createdAt, this.editedAt, this.creator});

  Data.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    statusObj = json["status_obj"] == null ? null : StatusObj.fromJson(json["status_obj"]);
    quantity = json["quantity"];
    fromDate = json["from_date"];
    asset = json["asset"] == null ? null : Asset.fromJson(json["asset"]);
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
    _data["status"] = status;
    if(statusObj != null) {
      _data["status_obj"] = statusObj?.toJson();
    }
    _data["quantity"] = quantity;
    _data["from_date"] = fromDate;
    if(asset != null) {
      _data["asset"] = asset?.toJson();
    }
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["edited_at"] = editedAt;
    if(creator != null) {
      _data["creator"] = creator?.toJson();
    }
    return _data;
  }

  Data copyWith({
    int? status,
    StatusObj? statusObj,
    int? quantity,
    String? fromDate,
    Asset? asset,
    String? id,
    String? createdAt,
    String? editedAt,
    Creator? creator,
  }) => Data(
    status: status ?? this.status,
    statusObj: statusObj ?? this.statusObj,
    quantity: quantity ?? this.quantity,
    fromDate: fromDate ?? this.fromDate,
    asset: asset ?? this.asset,
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

class Asset {
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
  String? lastCheckedDate;
  String? startDateOfUse;
  String? typeId;
  String? imageUrl;
  Type? type;
  Category? category;
  String? id;
  String? createdAt;
  String? editedAt;

  Asset({this.assetName, this.assetCode, this.isMovable, this.status, this.statusObj, this.manufacturingYear, this.serialNumber, this.quantity, this.description, this.lastMaintenanceTime, this.lastCheckedDate, this.startDateOfUse, this.typeId, this.imageUrl, this.type, this.category, this.id, this.createdAt, this.editedAt});

  Asset.fromJson(Map<String, dynamic> json) {
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
    lastCheckedDate = json["last_checked_date"];
    startDateOfUse = json["start_date_of_use"];
    typeId = json["type_id"];
    imageUrl = json["image_url"];
    type = json["type"] == null ? null : Type.fromJson(json["type"]);
    category = json["category"] == null ? null : Category.fromJson(json["category"]);
    id = json["id"];
    createdAt = json["created_at"];
    editedAt = json["edited_at"];
  }

  static List<Asset> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Asset.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
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
    _data["last_checked_date"] = lastCheckedDate;
    _data["start_date_of_use"] = startDateOfUse;
    _data["type_id"] = typeId;
    _data["image_url"] = imageUrl;
    if(type != null) {
      _data["type"] = type?.toJson();
    }
    if(category != null) {
      _data["category"] = category?.toJson();
    }
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["edited_at"] = editedAt;
    return _data;
  }

  Asset copyWith({
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
    String? lastCheckedDate,
    String? startDateOfUse,
    String? typeId,
    String? imageUrl,
    Type? type,
    Category? category,
    String? id,
    String? createdAt,
    String? editedAt,
  }) => Asset(
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
    lastCheckedDate: lastCheckedDate ?? this.lastCheckedDate,
    startDateOfUse: startDateOfUse ?? this.startDateOfUse,
    typeId: typeId ?? this.typeId,
    imageUrl: imageUrl ?? this.imageUrl,
    type: type ?? this.type,
    category: category ?? this.category,
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    editedAt: editedAt ?? this.editedAt,
  );
}

class Category {
  String? categoryName;
  String? description;
  String? teamId;
  String? id;
  String? createdAt;
  String? editedAt;

  Category({this.categoryName, this.description, this.teamId, this.id, this.createdAt, this.editedAt});

  Category.fromJson(Map<String, dynamic> json) {
    categoryName = json["category_name"];
    description = json["description"];
    teamId = json["team_id"];
    id = json["id"];
    createdAt = json["created_at"];
    editedAt = json["edited_at"];
  }

  static List<Category> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Category.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["category_name"] = categoryName;
    _data["description"] = description;
    _data["team_id"] = teamId;
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["edited_at"] = editedAt;
    return _data;
  }

  Category copyWith({
    String? categoryName,
    String? description,
    String? teamId,
    String? id,
    String? createdAt,
    String? editedAt,
  }) => Category(
    categoryName: categoryName ?? this.categoryName,
    description: description ?? this.description,
    teamId: teamId ?? this.teamId,
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    editedAt: editedAt ?? this.editedAt,
  );
}

class Type {
  String? typeCode;
  String? typeName;
  String? description;
  int? unit;
  String? imageUrl;
  String? categoryId;
  String? id;
  String? createdAt;
  String? editedAt;

  Type({this.typeCode, this.typeName, this.description, this.unit, this.imageUrl, this.categoryId, this.id, this.createdAt, this.editedAt});

  Type.fromJson(Map<String, dynamic> json) {
    typeCode = json["type_code"];
    typeName = json["type_name"];
    description = json["description"];
    unit = json["unit"];
    imageUrl = json["image_url"];
    categoryId = json["category_id"];
    id = json["id"];
    createdAt = json["created_at"];
    editedAt = json["edited_at"];
  }

  static List<Type> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Type.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["type_code"] = typeCode;
    _data["type_name"] = typeName;
    _data["description"] = description;
    _data["unit"] = unit;
    _data["image_url"] = imageUrl;
    _data["category_id"] = categoryId;
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["edited_at"] = editedAt;
    return _data;
  }

  Type copyWith({
    String? typeCode,
    String? typeName,
    String? description,
    int? unit,
    String? imageUrl,
    String? categoryId,
    String? id,
    String? createdAt,
    String? editedAt,
  }) => Type(
    typeCode: typeCode ?? this.typeCode,
    typeName: typeName ?? this.typeName,
    description: description ?? this.description,
    unit: unit ?? this.unit,
    imageUrl: imageUrl ?? this.imageUrl,
    categoryId: categoryId ?? this.categoryId,
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    editedAt: editedAt ?? this.editedAt,
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