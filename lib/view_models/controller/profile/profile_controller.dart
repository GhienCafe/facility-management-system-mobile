import 'dart:io';
import 'package:FMS/models/login/user_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../../data/response/status.dart';
import '../../../res/repository/profile_repository/profile_repository.dart';
import '../../../utlis/utlis.dart';
import '../../../view/profile/profile_detail.dart';

class ProfileController extends GetxController {
  RxString imageUser = ''.obs;
  RxString imagePath = ''.obs;
  RxString imageUrl = ''.obs;
  RxString error = ''.obs;
  final _api = ProfileRepository();
  final currentUser = UserModel().obs;
  final rxRequestStatus = StatusAPI.LOADING.obs;
  void setRexRequestStatus(StatusAPI _value) => rxRequestStatus.value = _value;
  void setCurrentUser(UserModel _value) => currentUser.value = _value;
  void setError(String _value) => error.value = _value;

  void getCurrentUser() {
    _api
        .getUserInfo()
        .then((value) => {
              setRexRequestStatus(StatusAPI.COMPLETED),
              setCurrentUser(value),
              imageUser = RxString(currentUser.value.data!.avatar.toString())
            })
        .onError((error, stackTrace) => {
              setError(error.toString()),
              setRexRequestStatus(StatusAPI.ERROR),
            });
  }

  void refreshApi() {
    setRexRequestStatus(StatusAPI.LOADING);
    _api
        .getUserInfo()
        .then((value) => {
      setRexRequestStatus(StatusAPI.COMPLETED),
      setCurrentUser(value),
    })
        .onError((error, stackTrace) => {
      setError(error.toString()),
      setRexRequestStatus(StatusAPI.ERROR),
    });
  }

  void updateUser(
      String? fullName, String? avatar, String? address, String? dob) {
    Map data = {
      "fullname": fullName,
      "avatar": avatar,
      "address": address,
      "dob": dob
    };
    _api.putUserInfo(data).then((value) {
      Utils.snackBarSuccess('Thành công', "Đã cập nhật");
    }).onError((error, stackTrace) {
      Utils.snackBarError('Có lỗi xảy ra: ', error.toString());
    });
  }

  // Function to select an image from the device's library
  Future<void> selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
    }
  }

  // Function to take a picture using the device's camera
  Future<void> takePicture() async {
    imageUser.value = '';
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
    }
  }

  // Function to upload the image to Firebase Cloud Storage
  Future<void> uploadImage() async {
    imageUser.value = '';
    final filePath = imagePath.value;
    if (filePath.isEmpty) {
      return;
    }
    try {
      final image = File(filePath).path.split('/').last;
      final ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('Avatar/$image.jpg');
      await ref.putFile(File(filePath));
      final url = await ref.getDownloadURL();
      imageUrl.value = url;
      final userInfo = currentUser.value.data;
      updateUser(userInfo?.fullname, url, userInfo?.address, userInfo?.dob);
      Get.to(() => const ProfileDetail());
    } catch (e) {}
  }

  // Function to clear the selected image
  void clearImage() {
    imageUser.value = '';
    imagePath.value = '';
    imageUrl.value = '';
  }
}
