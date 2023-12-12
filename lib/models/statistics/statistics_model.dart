class StatisticsModel {
  int? statusCode;
  String? message;
  Data? data;

  StatisticsModel({this.statusCode, this.message, this.data});

  StatisticsModel.fromJson(Map<String, dynamic> json) {
    statusCode = json["status_code"];
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  static List<StatisticsModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => StatisticsModel.fromJson(map)).toList();
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

  StatisticsModel copyWith({
    int? statusCode,
    String? message,
    Data? data,
  }) => StatisticsModel(
    statusCode: statusCode ?? this.statusCode,
    message: message ?? this.message,
    data: data ?? this.data,
  );
}

class Data {
  AssetCheckTask? assetCheckTask;
  RepairTask? repairTask;
  ReplaceTask? replaceTask;
  TransportTask? transportTask;
  MaintenanceTask? maintenanceTask;
  InventoryCheckTask? inventoryCheckTask;

  Data({this.assetCheckTask, this.repairTask, this.replaceTask, this.transportTask, this.maintenanceTask, this.inventoryCheckTask});

  Data.fromJson(Map<String, dynamic> json) {
    assetCheckTask = json["asset_check_task"] == null ? null : AssetCheckTask.fromJson(json["asset_check_task"]);
    repairTask = json["repair_task"] == null ? null : RepairTask.fromJson(json["repair_task"]);
    replaceTask = json["replace_task"] == null ? null : ReplaceTask.fromJson(json["replace_task"]);
    transportTask = json["transport_task"] == null ? null : TransportTask.fromJson(json["transport_task"]);
    maintenanceTask = json["maintenance_task"] == null ? null : MaintenanceTask.fromJson(json["maintenance_task"]);
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
    if(transportTask != null) {
      _data["transport_task"] = transportTask?.toJson();
    }
    if(maintenanceTask != null) {
      _data["maintenance_task"] = maintenanceTask?.toJson();
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
    TransportTask? transportTask,
    MaintenanceTask? maintenanceTask,
    InventoryCheckTask? inventoryCheckTask,
  }) => Data(
    assetCheckTask: assetCheckTask ?? this.assetCheckTask,
    repairTask: repairTask ?? this.repairTask,
    replaceTask: replaceTask ?? this.replaceTask,
    transportTask: transportTask ?? this.transportTask,
    maintenanceTask: maintenanceTask ?? this.maintenanceTask,
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

class MaintenanceTask {
  int? total;
  int? process;
  int? complete;
  int? waiting;
  int? reported;

  MaintenanceTask({this.total, this.process, this.complete, this.waiting, this.reported});

  MaintenanceTask.fromJson(Map<String, dynamic> json) {
    total = json["total"];
    process = json["process"];
    complete = json["complete"];
    waiting = json["waiting"];
    reported = json["reported"];
  }

  static List<MaintenanceTask> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => MaintenanceTask.fromJson(map)).toList();
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

  MaintenanceTask copyWith({
    int? total,
    int? process,
    int? complete,
    int? waiting,
    int? reported,
  }) => MaintenanceTask(
    total: total ?? this.total,
    process: process ?? this.process,
    complete: complete ?? this.complete,
    waiting: waiting ?? this.waiting,
    reported: reported ?? this.reported,
  );
}

class TransportTask {
  int? total;
  int? process;
  int? complete;
  int? waiting;
  int? reported;

  TransportTask({this.total, this.process, this.complete, this.waiting, this.reported});

  TransportTask.fromJson(Map<String, dynamic> json) {
    total = json["total"];
    process = json["process"];
    complete = json["complete"];
    waiting = json["waiting"];
    reported = json["reported"];
  }

  static List<TransportTask> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => TransportTask.fromJson(map)).toList();
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

  TransportTask copyWith({
    int? total,
    int? process,
    int? complete,
    int? waiting,
    int? reported,
  }) => TransportTask(
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