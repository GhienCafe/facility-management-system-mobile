abstract class BaseApiService {
  // here wee define the method
  Future<dynamic> getApi(String url);

  // in post data we sen the parameter that's why we use dynamic data
  Future<dynamic> postApi(dynamic data, String url);

  Future<dynamic> putApi(dynamic data, String url);
}
