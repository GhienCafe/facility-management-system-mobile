import 'dart:io';

import 'package:FMS/utlis/utlis.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../res/color/colors.dart';
import '../../view_models/controller/report/report_controller.dart';
import '../../view_models/controller/task/task_controller.dart';

class ReportCheckPage extends StatelessWidget {
  final taskController = Get.find<TaskController>();
  final reportController = Get.put(ReportController());
  ReportCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: AppColor.whiteColor,
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xff0e4e86),
                Color(0xff1461a2),
                Color(0xff2e7abb),
              ],
            )),
          ),
          title: const Text(
            "Báo Cáo Nhiệm Vụ",
            style: TextStyle(
              color: AppColor.whiteColor,
              letterSpacing: 1,
            ),
          ),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.only(right: 20.0, left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MultiFileUploadScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

class MultiFileUploadScreen extends StatefulWidget {
  const MultiFileUploadScreen({Key? key}) : super(key: key);

  @override
  MultiFileUploadScreenState createState() => MultiFileUploadScreenState();
}

class MultiFileUploadScreenState extends State<MultiFileUploadScreen> {
  List<File> images = [];
  TextEditingController nameController = TextEditingController();
  bool _isLoading = false;
  bool isVerified = false;
  final reportController = Get.find<ReportController>();
  final taskController = Get.find<TaskController>();
  List<String> downloadUrls = [];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 800,
      child: SingleChildScrollView(
        child: Column(children: [
          const ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Icon(Icons.add_a_photo, color: Colors.grey),
            title: Text("Hình ảnh báo cáo:",
                style: TextStyle(fontSize: 20, color: Colors.grey)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  takePicture(); // Function to capture an image.
                },
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.camera_alt, // Use the camera icon.
                      size: 30,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  getMultiImage();
                },
                child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                      child: Icon(
                        Icons.upload_file,
                        size: 30,
                      ),
                    )),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    images.clear();
                    downloadUrls = [];
                  });
                },
                child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                      child: Icon(
                        Icons.delete,
                        size: 30,
                      ),
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(right: 10, left: 10),
            child: Scrollbar(
              child: SizedBox(
                width: Get.width,
                height: 230,
                child: images.isEmpty
                    ? const Center(
                        child: Text("Không Có Hình Ảnh!!!",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20)),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, i) {
                          return Dismissible(
                            key: Key(images[i].path),
                            onDismissed: (direction) {
                              setState(() {
                                images.removeAt(i);
                              });
                            },
                            direction: DismissDirection.vertical,
                            background: Container(
                              color: Colors.red,
                              child:
                                  const Icon(Icons.delete, color: Colors.white),
                            ),
                            child: Container(
                              width: 120,
                              height: 200,
                              margin: const EdgeInsets.only(
                                  top: 10, bottom: 10, right: 5),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 3),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  images[i],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: images.length,
                      ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 180,
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Icon(Icons.construction, color: Colors.grey),
                  title: Text("Cần Sửa Chữa:",
                      style: TextStyle(fontSize: 20, color: Colors.grey)),
                ),
              ),
              Checkbox(
                value: isVerified,
                onChanged: (newValue) {
                  setState(() {
                    isVerified = newValue!;
                    print(isVerified);
                  });
                },
              ),
            ],
          ),
          const ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Icon(Icons.description, color: Colors.grey),
            title: Text("Nội dung báo cáo:",
                style: TextStyle(fontSize: 20, color: Colors.grey)),
          ),
          SizedBox(
            height: 200,
            child: TextField(
              controller: nameController,
              enableSuggestions: true,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: 'Mô tả báo cáo...',
              ),
            ),
          ),
          MaterialButton(
            color: Colors.blue,
            minWidth: double.infinity,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            height: 50,
            onPressed: () async {
              final taskInfo = taskController.taskDetail.value.data;
              String nonID =
                  taskInfo?.id ?? "00000000-0000-0000-0000-000000000000";
              if (nameController.text.isEmpty && downloadUrls.isEmpty) {
                Utils.snackBar(
                    "Lưu Ý", "Hình ảnh và mô tả không được để trống");
              } else {
                setState(() {
                  _isLoading = true;
                });
                for (int i = 0; i < images.length; i++) {
                  String url = await uploadFile(images[i]);
                  downloadUrls.add(url);
                  if (i == images.length - 1) {
                    reportController.reportCheckTask(
                        nonID, nameController.text, downloadUrls, isVerified);
                    setState(() {
                      _isLoading = false;
                    });
                  }
                }
              }
            },
            child: _isLoading
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: AppColor.whiteColor),
                      Text(" Sending Report",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ) // Display a loading indicator
                : const Text("Upload",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20)), // Show the button text
          )
        ]),
      ),
    );
  }

  final ImagePicker _picker = ImagePicker();
  getMultiImage() async {
    final List<XFile> pickedImages =
        await _picker.pickMultiImage(imageQuality: 50);
    for (var e in pickedImages) {
      images.add(File(e.path));
    }
    setState(() {});
  }

  Future<void> takePicture() async {
    try {
      final XFile? image =
          await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
      if (image != null) {
        images.add(File(image.path));
        setState(() {});
      }
    } catch (e) {
      null;
    }
  }

  Future<String> uploadFile(File file) async {
    final metaData = SettableMetadata(contentType: 'image/jpeg');
    final storageRef = FirebaseStorage.instance.ref();
    Reference ref =
        storageRef.child('Report/${DateTime.now().microsecondsSinceEpoch}.jpg');
    final uploadTask = ref.putFile(file, metaData);
    final taskSnapshot = await uploadTask.whenComplete(
      () {},
    );
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }
}
