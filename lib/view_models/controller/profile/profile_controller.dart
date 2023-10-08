import 'dart:io';
import 'package:FMS/models/login/user_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../../res/repository/profile_repository/profile_repository.dart';

class ProfileController extends GetxController {
  RxString imagePath = ''.obs;
  RxString imageUrl = ''.obs;
  final _api = ProfileRepository();
  final currentUser = UserModel().obs;
  void setCurrentUser(UserModel _value) =>
      currentUser.value = _value;
  void getCurrentUser() {
    _api
        .getUserInfo()
        .then((value) => {
      setCurrentUser(value),
    })
        .onError((error, stackTrace) => {
          print("Error at Profile controller: $error")
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
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
    }
  }

  // Function to upload the image to Firebase Cloud Storage
  Future<void> uploadImage() async {
    final filePath = imagePath.value;
    if (filePath.isEmpty) {
      print('No image selected');
      return;
    }
    try {
      final image = File(filePath).path.split('/').last;
      final ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('Avatar/$image.jpg'); // Define the path to store the image
      await ref.putFile(File(filePath));

      // Get the download URL of the uploaded image
      final url = await ref.getDownloadURL();
      imageUrl.value = url;
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  // Function to clear the selected image
  void clearImage() {
    imagePath.value = '';
    imageUrl.value = '';
  }
}
