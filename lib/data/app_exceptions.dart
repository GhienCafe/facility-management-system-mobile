class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class InternetException extends AppException {
  InternetException([String? message]) : super(message, 'No internet');
}

class RequestTimeOUt extends AppException {
  RequestTimeOUt([String? message]) : super(message, 'Request Time out ');
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, 'Internal Server Error');
}

class InvalidUrlException extends AppException {
  InvalidUrlException([String? message]) : super(message, 'Invalid url ');
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, '');
}
