class TaskListModel {
  int? statusCode;
  String? message;
  int? totalCount;
  int? pageSize;
  int? page;
  int? totalPages;
  List<Data>? data;

  TaskListModel({this.statusCode, this.message, this.totalCount, this.pageSize, this.page, this.totalPages, this.data});

  TaskListModel.fromJson(Map<String, dynamic> json) {
    statusCode = json["status_code"];
    message = json["message"];
    totalCount = json["total_count"];
    pageSize = json["page_size"];
    page = json["page"];
    totalPages = json["total_pages"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  static List<TaskListModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => TaskListModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status_code"] = statusCode;
    _data["message"] = message;
    _data["total_count"] = totalCount;
    _data["page_size"] = pageSize;
    _data["page"] = page;
    _data["total_pages"] = totalPages;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  TaskListModel copyWith({
    int? statusCode,
    String? message,
    int? totalCount,
    int? pageSize,
    int? page,
    int? totalPages,
    List<Data>? data,
  }) => TaskListModel(
    statusCode: statusCode ?? this.statusCode,
    message: message ?? this.message,
    totalCount: totalCount ?? this.totalCount,
    pageSize: pageSize ?? this.pageSize,
    page: page ?? this.page,
    totalPages: totalPages ?? this.totalPages,
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
  int? quantity;
  String? toRoomId;

  Data({this.id, this.createdAt, this.editedAt, this.creator, this.editor, this.assetId, this.requestCode, this.requestDate, this.completionDate, this.status, this.statusObj, this.description, this.notes, this.result, this.isInternal, this.checkin, this.checkout, this.assignedTo, this.assetTypeId, this.categoryId, this.priority, this.priorityObj, this.type, this.typeObj, this.quantity, this.toRoomId});

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
    quantity = json["quantity"];
    toRoomId = json["to_room_id"];
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
    _data["quantity"] = quantity;
    _data["to_room_id"] = toRoomId;
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
    int? quantity,
    String? toRoomId,
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
    quantity: quantity ?? this.quantity,
    toRoomId: toRoomId ?? this.toRoomId,
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