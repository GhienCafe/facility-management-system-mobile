import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view_models/controller/profile/profile_controller.dart';

class ImageUploads extends StatefulWidget {
  ImageUploads({Key? key}) : super(key: key);

  @override
  _ImageUploadsState createState() => _ImageUploadsState();
}

class _ImageUploadsState extends State<ImageUploads> {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  if (controller.imagePath.value.isEmpty) {
                    return const CircleAvatar(
                      radius: 150,
                      backgroundColor: Colors.grey,
                      child: Text("Không Tìm Thấy",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    );
                  } else {
                    return CircleAvatar(
                      radius: 150,
                      child: ClipOval(
                        child: Image.file(
                          File(controller.imagePath.value),
                          height: 300,
                          width:
                              300, // Set width and height to maintain a circular shape
                          fit: BoxFit
                              .cover, // Ensure the image fills the circular shape
                        ),
                      ),
                    );
                  }
                }),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: controller.selectImage,
                      child: const Icon(Icons.collections),
                    ),
                    ElevatedButton(
                      onPressed: controller.takePicture,
                      child: const Icon(Icons.camera_alt_sharp),
                    ),
                    ElevatedButton(
                      onPressed: controller.uploadImage,
                      child: const Icon(Icons.file_upload),
                    ),
                    ElevatedButton(
                      onPressed: controller.clearImage,
                      child: const Icon(Icons.clear),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
