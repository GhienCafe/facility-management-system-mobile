import 'package:FMS/data/network/network_api_services.dart';
import 'package:FMS/res/app_url/app_url.dart';

import '../../../models/assets/asset_model.dart';

class QRRepository {
  final _apiService = NetworkApiServices();

  Future<AssetModel> scanAsset(String id) async {
    dynamic response = await _apiService.getApiAuthor("${AppUrl.getAsset}/$id");
    return AssetModel.fromJson(response);
  }

  Future<AssetModel> scanAssetInRoom(String id) async {
    dynamic response = await _apiService.getApiAuthor("${AppUrl.loginApi}/$id");
    return AssetModel.fromJson(response);
  }

}
