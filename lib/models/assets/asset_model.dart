class AssetModel {
  int? statusCode;
  String? message;
  Data? data;

  AssetModel({this.statusCode, this.message, this.data});

  AssetModel.fromJson(Map<String, dynamic> json) {
    statusCode = json["status_code"];
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  static List<AssetModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => AssetModel.fromJson(map)).toList();
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

  AssetModel copyWith({
    int? statusCode,
    String? message,
    Data? data,
  }) => AssetModel(
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
  String? assetName;
  String? assetCode;
  bool? isMovable;
  int? status;
  StatusObj? statusObj;
  int? manufacturingYear;
  String? serialNumber;
  int? quantity;
  String? description;
  String? imageUrl;
  bool? isRented;
  String? lastMaintenanceTime;
  String? typeId;
  String? modelId;
  Type? type;
  Model? model;
  String? lastCheckedDate;
  String? startDateOfUse;
  Category? category;

  Data({this.id, this.createdAt, this.editedAt, this.creator, this.editor, this.assetName, this.assetCode, this.isMovable, this.status, this.statusObj, this.manufacturingYear, this.serialNumber, this.quantity, this.description, this.imageUrl, this.isRented, this.lastMaintenanceTime, this.typeId, this.modelId, this.type, this.model, this.lastCheckedDate, this.startDateOfUse, this.category});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    editedAt = json["edited_at"];
    creator = json["creator"] == null ? null : Creator.fromJson(json["creator"]);
    editor = json["editor"] == null ? null : Editor.fromJson(json["editor"]);
    assetName = json["asset_name"];
    assetCode = json["asset_code"];
    isMovable = json["is_movable"];
    status = json["status"];
    statusObj = json["status_obj"] == null ? null : StatusObj.fromJson(json["status_obj"]);
    manufacturingYear = json["manufacturing_year"];
    serialNumber = json["serial_number"];
    quantity = json["quantity"];
    description = json["description"];
    imageUrl = json["image_url"];
    isRented = json["is_rented"];
    lastMaintenanceTime = json["last_maintenance_time"];
    typeId = json["type_id"];
    modelId = json["model_id"];
    type = json["type"] == null ? null : Type.fromJson(json["type"]);
    model = json["model"] == null ? null : Model.fromJson(json["model"]);
    lastCheckedDate = json["last_checked_date"];
    startDateOfUse = json["start_date_of_use"];
    category = json["category"] == null ? null : Category.fromJson(json["category"]);
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
    _data["image_url"] = imageUrl;
    _data["is_rented"] = isRented;
    _data["last_maintenance_time"] = lastMaintenanceTime;
    _data["type_id"] = typeId;
    _data["model_id"] = modelId;
    if(type != null) {
      _data["type"] = type?.toJson();
    }
    if(model != null) {
      _data["model"] = model?.toJson();
    }
    _data["last_checked_date"] = lastCheckedDate;
    _data["start_date_of_use"] = startDateOfUse;
    if(category != null) {
      _data["category"] = category?.toJson();
    }
    return _data;
  }

  Data copyWith({
    String? id,
    String? createdAt,
    String? editedAt,
    Creator? creator,
    Editor? editor,
    String? assetName,
    String? assetCode,
    bool? isMovable,
    int? status,
    StatusObj? statusObj,
    int? manufacturingYear,
    String? serialNumber,
    int? quantity,
    String? description,
    String? imageUrl,
    bool? isRented,
    String? lastMaintenanceTime,
    String? typeId,
    String? modelId,
    Type? type,
    Model? model,
    String? lastCheckedDate,
    String? startDateOfUse,
    Category? category,
  }) => Data(
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
    imageUrl: imageUrl ?? this.imageUrl,
    isRented: isRented ?? this.isRented,
    lastMaintenanceTime: lastMaintenanceTime ?? this.lastMaintenanceTime,
    typeId: typeId ?? this.typeId,
    modelId: modelId ?? this.modelId,
    type: type ?? this.type,
    model: model ?? this.model,
    lastCheckedDate: lastCheckedDate ?? this.lastCheckedDate,
    startDateOfUse: startDateOfUse ?? this.startDateOfUse,
    category: category ?? this.category,
  );
}

class Category {
  String? id;
  String? createdAt;
  String? editedAt;
  Creator3? creator;
  Editor3? editor;
  String? categoryName;
  String? description;
  String? teamId;
  Team? team;

  Category({this.id, this.createdAt, this.editedAt, this.creator, this.editor, this.categoryName, this.description, this.teamId, this.team});

  Category.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    editedAt = json["edited_at"];
    creator = json["creator"] == null ? null : Creator3.fromJson(json["creator"]);
    editor = json["editor"] == null ? null : Editor3.fromJson(json["editor"]);
    categoryName = json["category_name"];
    description = json["description"];
    teamId = json["team_id"];
    team = json["team"] == null ? null : Team.fromJson(json["team"]);
  }

  static List<Category> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Category.fromJson(map)).toList();
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
    _data["category_name"] = categoryName;
    _data["description"] = description;
    _data["team_id"] = teamId;
    if(team != null) {
      _data["team"] = team?.toJson();
    }
    return _data;
  }

  Category copyWith({
    String? id,
    String? createdAt,
    String? editedAt,
    Creator3? creator,
    Editor3? editor,
    String? categoryName,
    String? description,
    String? teamId,
    Team? team,
  }) => Category(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    editedAt: editedAt ?? this.editedAt,
    creator: creator ?? this.creator,
    editor: editor ?? this.editor,
    categoryName: categoryName ?? this.categoryName,
    description: description ?? this.description,
    teamId: teamId ?? this.teamId,
    team: team ?? this.team,
  );
}

class Team {
  String? id;
  String? createdAt;
  String? editedAt;
  Creator4? creator;
  Editor4? editor;
  String? teamName;
  String? description;
  int? totalMember;

  Team({this.id, this.createdAt, this.editedAt, this.creator, this.editor, this.teamName, this.description, this.totalMember});

  Team.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    editedAt = json["edited_at"];
    creator = json["creator"] == null ? null : Creator4.fromJson(json["creator"]);
    editor = json["editor"] == null ? null : Editor4.fromJson(json["editor"]);
    teamName = json["team_name"];
    description = json["description"];
    totalMember = json["total_member"];
  }

  static List<Team> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Team.fromJson(map)).toList();
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
    _data["team_name"] = teamName;
    _data["description"] = description;
    _data["total_member"] = totalMember;
    return _data;
  }

  Team copyWith({
    String? id,
    String? createdAt,
    String? editedAt,
    Creator4? creator,
    Editor4? editor,
    String? teamName,
    String? description,
    int? totalMember,
  }) => Team(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    editedAt: editedAt ?? this.editedAt,
    creator: creator ?? this.creator,
    editor: editor ?? this.editor,
    teamName: teamName ?? this.teamName,
    description: description ?? this.description,
    totalMember: totalMember ?? this.totalMember,
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

class Model {
  String? id;
  String? createdAt;
  String? editedAt;
  Creator2? creator;
  Editor2? editor;
  String? modelName;
  String? description;

  Model({this.id, this.createdAt, this.editedAt, this.creator, this.editor, this.modelName, this.description});

  Model.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    editedAt = json["edited_at"];
    creator = json["creator"] == null ? null : Creator2.fromJson(json["creator"]);
    editor = json["editor"] == null ? null : Editor2.fromJson(json["editor"]);
    modelName = json["model_name"];
    description = json["description"];
  }

  static List<Model> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Model.fromJson(map)).toList();
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
    _data["model_name"] = modelName;
    _data["description"] = description;
    return _data;
  }

  Model copyWith({
    String? id,
    String? createdAt,
    String? editedAt,
    Creator2? creator,
    Editor2? editor,
    String? modelName,
    String? description,
  }) => Model(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    editedAt: editedAt ?? this.editedAt,
    creator: creator ?? this.creator,
    editor: editor ?? this.editor,
    modelName: modelName ?? this.modelName,
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

class Type {
  String? id;
  String? createdAt;
  String? editedAt;
  Creator1? creator;
  Editor1? editor;
  String? typeCode;
  String? typeName;
  String? description;
  int? unit;
  UnitObj? unitObj;
  String? imageUrl;
  String? categoryId;

  Type({this.id, this.createdAt, this.editedAt, this.creator, this.editor, this.typeCode, this.typeName, this.description, this.unit, this.unitObj, this.imageUrl, this.categoryId});

  Type.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    editedAt = json["edited_at"];
    creator = json["creator"] == null ? null : Creator1.fromJson(json["creator"]);
    editor = json["editor"] == null ? null : Editor1.fromJson(json["editor"]);
    typeCode = json["type_code"];
    typeName = json["type_name"];
    description = json["description"];
    unit = json["unit"];
    unitObj = json["unit_obj"] == null ? null : UnitObj.fromJson(json["unit_obj"]);
    imageUrl = json["image_url"];
    categoryId = json["category_id"];
  }

  static List<Type> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Type.fromJson(map)).toList();
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
    _data["type_code"] = typeCode;
    _data["type_name"] = typeName;
    _data["description"] = description;
    _data["unit"] = unit;
    if(unitObj != null) {
      _data["unit_obj"] = unitObj?.toJson();
    }
    _data["image_url"] = imageUrl;
    _data["category_id"] = categoryId;
    return _data;
  }

  Type copyWith({
    String? id,
    String? createdAt,
    String? editedAt,
    Creator1? creator,
    Editor1? editor,
    String? typeCode,
    String? typeName,
    String? description,
    int? unit,
    UnitObj? unitObj,
    String? imageUrl,
    String? categoryId,
  }) => Type(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    editedAt: editedAt ?? this.editedAt,
    creator: creator ?? this.creator,
    editor: editor ?? this.editor,
    typeCode: typeCode ?? this.typeCode,
    typeName: typeName ?? this.typeName,
    description: description ?? this.description,
    unit: unit ?? this.unit,
    unitObj: unitObj ?? this.unitObj,
    imageUrl: imageUrl ?? this.imageUrl,
    categoryId: categoryId ?? this.categoryId,
  );
}

class UnitObj {
  int? value;
  String? name;
  String? displayName;

  UnitObj({this.value, this.name, this.displayName});

  UnitObj.fromJson(Map<String, dynamic> json) {
    value = json["value"];
    name = json["name"];
    displayName = json["display_name"];
  }

  static List<UnitObj> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => UnitObj.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["value"] = value;
    _data["name"] = name;
    _data["display_name"] = displayName;
    return _data;
  }

  UnitObj copyWith({
    int? value,
    String? name,
    String? displayName,
  }) => UnitObj(
    value: value ?? this.value,
    name: name ?? this.name,
    displayName: displayName ?? this.displayName,
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