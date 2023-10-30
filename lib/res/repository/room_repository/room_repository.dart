import 'package:FMS/data/network/network_api_services.dart';
import 'package:FMS/res/app_url/app_url.dart';

import '../../../models/room/asset_in_room_model.dart';
import '../../../models/room/room_model.dart';


class RoomRepository {
  final _apiService = NetworkApiServices();

  Future<RoomModel> getInfoRoom(String id) async {
    dynamic response = await _apiService.getApiAuthor("${AppUrl.getInfoRoom}/$id");
    return RoomModel.fromJson(response);
  }

  Future<AssetInRoomModel> getAssetInRoom(String id) async {
    dynamic response = await _apiService.getApiAuthor("${AppUrl.getAssetInRoom}/$id");
    return AssetInRoomModel.fromJson(response);
  }

}
