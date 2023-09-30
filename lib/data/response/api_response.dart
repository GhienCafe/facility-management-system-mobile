import 'package:FMS/data/response/status.dart';

class ApiResponse<T> {
  StatusAPI? status;
  T? data;
  String? message;

  ApiResponse(this.data, this.message, this.status);

  ApiResponse.loading() : status = StatusAPI.LOADING;
  ApiResponse.completed(this.data) : status = StatusAPI.COMPLETED;
  ApiResponse.error(this.message) : status = StatusAPI.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data: $data";
  }
}
