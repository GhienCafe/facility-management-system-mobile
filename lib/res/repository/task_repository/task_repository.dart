import 'package:FMS/data/network/network_api_services.dart';
import 'package:FMS/models/task/tasks_list_model.dart';
import 'package:FMS/res/app_url/app_url.dart';

class TaskRepository {
  final _apiService = NetworkApiServices();

  Future<TaskListModel> taskListApi() async {
    dynamic response = await _apiService.getApiAuthor(AppUrl.getListTask);
    return TaskListModel.fromJson(response);
  }
}