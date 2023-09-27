class NotificationListModel {
  int? totalCount;
  int? pageSize;
  int? offset;
  int? totalPages;
  List<Data>? data;
  int? statusCode;
  String? message;

  NotificationListModel(
      {this.totalCount,
      this.pageSize,
      this.offset,
      this.totalPages,
      this.data,
      this.statusCode,
      this.message});

  NotificationListModel.fromJson(Map<String, dynamic> json) {
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
}

class Data {
  String? title;
  String? shortContent;
  String? content;
  bool? isRead;
  Type? type;
  String? itemId;
  String? id;
  String? createdAt;
  String? editedAt;

  Data(
      {this.title,
      this.shortContent,
      this.content,
      this.isRead,
      this.type,
      this.itemId,
      this.id,
      this.createdAt,
      this.editedAt});

  Data.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    shortContent = json["short_content"];
    content = json["content"];
    isRead = json["is_read"];
    type = json["type"] == null ? null : Type.fromJson(json["type"]);
    itemId = json["item_id"];
    id = json["id"];
    createdAt = json["created_at"];
    editedAt = json["edited_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["short_content"] = shortContent;
    _data["content"] = content;
    _data["is_read"] = isRead;
    if (type != null) {
      _data["type"] = type?.toJson();
    }
    _data["item_id"] = itemId;
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["edited_at"] = editedAt;
    return _data;
  }
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["value"] = value;
    _data["name"] = name;
    _data["display_name"] = displayName;
    return _data;
  }
}
