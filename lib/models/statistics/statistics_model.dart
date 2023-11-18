
class StatisticsModel {
  Data? data;
  int? statusCode;
  String? message;

  StatisticsModel({this.data, this.statusCode, this.message});

  StatisticsModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
    statusCode = json["status_code"];
    message = json["message"];
  }

  static List<StatisticsModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => StatisticsModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    _data["status_code"] = statusCode;
    _data["message"] = message;
    return _data;
  }

  StatisticsModel copyWith({
    Data? data,
    int? statusCode,
    String? message,
  }) => StatisticsModel(
    data: data ?? this.data,
    statusCode: statusCode ?? this.statusCode,
    message: message ?? this.message,
  );
}

class Data {
  AssetCheckTask? assetCheckTask;
  RepairTask? repairTask;
  ReplaceTask? replaceTask;
  InventoryCheckTask? inventoryCheckTask;

  Data({this.assetCheckTask, this.repairTask, this.replaceTask, this.inventoryCheckTask});

  Data.fromJson(Map<String, dynamic> json) {
    assetCheckTask = json["asset_check_task"] == null ? null : AssetCheckTask.fromJson(json["asset_check_task"]);
    repairTask = json["repair_task"] == null ? null : RepairTask.fromJson(json["repair_task"]);
    replaceTask = json["replace_task"] == null ? null : ReplaceTask.fromJson(json["replace_task"]);
    inventoryCheckTask = json["inventory_check_task"] == null ? null : InventoryCheckTask.fromJson(json["inventory_check_task"]);
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(assetCheckTask != null) {
      _data["asset_check_task"] = assetCheckTask?.toJson();
    }
    if(repairTask != null) {
      _data["repair_task"] = repairTask?.toJson();
    }
    if(replaceTask != null) {
      _data["replace_task"] = replaceTask?.toJson();
    }
    if(inventoryCheckTask != null) {
      _data["inventory_check_task"] = inventoryCheckTask?.toJson();
    }
    return _data;
  }

  Data copyWith({
    AssetCheckTask? assetCheckTask,
    RepairTask? repairTask,
    ReplaceTask? replaceTask,
    InventoryCheckTask? inventoryCheckTask,
  }) => Data(
    assetCheckTask: assetCheckTask ?? this.assetCheckTask,
    repairTask: repairTask ?? this.repairTask,
    replaceTask: replaceTask ?? this.replaceTask,
    inventoryCheckTask: inventoryCheckTask ?? this.inventoryCheckTask,
  );
}

class InventoryCheckTask {
  int? total;
  int? process;
  int? complete;
  int? waiting;
  int? reported;

  InventoryCheckTask({this.total, this.process, this.complete, this.waiting, this.reported});

  InventoryCheckTask.fromJson(Map<String, dynamic> json) {
    total = json["total"];
    process = json["process"];
    complete = json["complete"];
    waiting = json["waiting"];
    reported = json["reported"];
  }

  static List<InventoryCheckTask> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => InventoryCheckTask.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["total"] = total;
    _data["process"] = process;
    _data["complete"] = complete;
    _data["waiting"] = waiting;
    _data["reported"] = reported;
    return _data;
  }

  InventoryCheckTask copyWith({
    int? total,
    int? process,
    int? complete,
    int? waiting,
    int? reported,
  }) => InventoryCheckTask(
    total: total ?? this.total,
    process: process ?? this.process,
    complete: complete ?? this.complete,
    waiting: waiting ?? this.waiting,
    reported: reported ?? this.reported,
  );
}

class ReplaceTask {
  int? total;
  int? process;
  int? complete;
  int? waiting;
  int? reported;

  ReplaceTask({this.total, this.process, this.complete, this.waiting, this.reported});

  ReplaceTask.fromJson(Map<String, dynamic> json) {
    total = json["total"];
    process = json["process"];
    complete = json["complete"];
    waiting = json["waiting"];
    reported = json["reported"];
  }

  static List<ReplaceTask> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => ReplaceTask.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["total"] = total;
    _data["process"] = process;
    _data["complete"] = complete;
    _data["waiting"] = waiting;
    _data["reported"] = reported;
    return _data;
  }

  ReplaceTask copyWith({
    int? total,
    int? process,
    int? complete,
    int? waiting,
    int? reported,
  }) => ReplaceTask(
    total: total ?? this.total,
    process: process ?? this.process,
    complete: complete ?? this.complete,
    waiting: waiting ?? this.waiting,
    reported: reported ?? this.reported,
  );
}

class RepairTask {
  int? total;
  int? process;
  int? complete;
  int? waiting;
  int? reported;

  RepairTask({this.total, this.process, this.complete, this.waiting, this.reported});

  RepairTask.fromJson(Map<String, dynamic> json) {
    total = json["total"];
    process = json["process"];
    complete = json["complete"];
    waiting = json["waiting"];
    reported = json["reported"];
  }

  static List<RepairTask> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => RepairTask.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["total"] = total;
    _data["process"] = process;
    _data["complete"] = complete;
    _data["waiting"] = waiting;
    _data["reported"] = reported;
    return _data;
  }

  RepairTask copyWith({
    int? total,
    int? process,
    int? complete,
    int? waiting,
    int? reported,
  }) => RepairTask(
    total: total ?? this.total,
    process: process ?? this.process,
    complete: complete ?? this.complete,
    waiting: waiting ?? this.waiting,
    reported: reported ?? this.reported,
  );
}

class AssetCheckTask {
  int? total;
  int? process;
  int? complete;
  int? waiting;
  int? reported;

  AssetCheckTask({this.total, this.process, this.complete, this.waiting, this.reported});

  AssetCheckTask.fromJson(Map<String, dynamic> json) {
    total = json["total"];
    process = json["process"];
    complete = json["complete"];
    waiting = json["waiting"];
    reported = json["reported"];
  }

  static List<AssetCheckTask> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => AssetCheckTask.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["total"] = total;
    _data["process"] = process;
    _data["complete"] = complete;
    _data["waiting"] = waiting;
    _data["reported"] = reported;
    return _data;
  }

  AssetCheckTask copyWith({
    int? total,
    int? process,
    int? complete,
    int? waiting,
    int? reported,
  }) => AssetCheckTask(
    total: total ?? this.total,
    process: process ?? this.process,
    complete: complete ?? this.complete,
    waiting: waiting ?? this.waiting,
    reported: reported ?? this.reported,
  );
}