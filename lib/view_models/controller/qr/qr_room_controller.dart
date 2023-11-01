import 'package:FMS/models/room/asset_in_room_model.dart';
import 'package:FMS/models/room/room_model.dart';
import 'package:FMS/res/repository/room_repository/room_repository.dart';
import 'package:FMS/res/routes/routes_name.dart';
import 'package:FMS/utlis/utlis.dart';
import 'package:get/get.dart';

import '../../../data/response/status.dart';
import '../../../view/qr_code/qr_room/qr_view_room.dart';

class QRRoomController extends GetxController {
  RxString error = ''.obs;
  final _api = RoomRepository();
  final rxRequestRoomStatus = StatusAPI.LOADING.obs;
  final room = RoomModel().obs;
  final assetInRoom = AssetInRoomModel().obs;

  void setRexRequestRoomStatus(StatusAPI _value) =>
      rxRequestRoomStatus.value = _value;

  void setCurrentRoomInfo(RoomModel _value) => room.value = _value;
  void setAssetInRoom(AssetInRoomModel _value) => assetInRoom.value = _value;
  void setError(String _value) => error.value = _value;

  Future<void> viewRoom(String id) async {
    try {
      final roomInfo = await _api.getInfoRoom(id);
      final assetInRoomInfo = await _api.getAssetInRoom(id);
      if(roomInfo.statusCode !=200 && assetInRoomInfo.statusCode != 200){
        Get.toNamed(RouteName.homeScreen);
        Utils.snackBarError("Xảy ra lỗi:", "Không tìm thấy thông tin phòng");
      } else{
        setCurrentRoomInfo(roomInfo);
        setAssetInRoom(assetInRoomInfo);
        setRexRequestRoomStatus(StatusAPI.COMPLETED);
        Get.to(() => QRResultRoom(id: id));
      }
    } catch (error) {
      setError(error.toString());
      setRexRequestRoomStatus(StatusAPI.ERROR);
    }
  }


  void refreshRoomInfoApi(String id) {
    setRexRequestRoomStatus(StatusAPI.LOADING);
    _api
        .getInfoRoom(id)
        .then((value) => {
              setRexRequestRoomStatus(StatusAPI.COMPLETED),
              setCurrentRoomInfo(value),
            })
        .onError((error, stackTrace) => {
              setError(error.toString()),
              setRexRequestRoomStatus(StatusAPI.ERROR),
            });
  }
}
