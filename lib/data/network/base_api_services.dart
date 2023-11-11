abstract class BaseApiService {
  // here wee define the method
  Future<dynamic> getApi(String url);

  Future<dynamic> postApi(dynamic data, String url);

  Future<dynamic> putApi(dynamic data, String url);
}
