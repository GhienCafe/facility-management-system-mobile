import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../res/color/colors.dart';
import '../../res/routes/routes_name.dart';

class AttentionPage extends StatelessWidget {
  const AttentionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: AppColor.whiteColor,
            onPressed: () {
              Get.toNamed(RouteName.profileScreen);
            },
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
            "Gợi Ý Trợ Giúp",
            style: TextStyle(
              color: AppColor.whiteColor,
              letterSpacing: 1,
            ),
          ),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AttentionItem(
                title: 'Chức Năng Ứng Dụng',
                content:
                    'Ứng dụng này được thiết kế để giúp nhân viên nhận các nhiệm vụ và báo cáo tình hình tài sản của công ty. Hãy sử dụng nó để nắm bắt và quản lý công việc của bạn.',
              ),
              Divider(),
              AttentionItem(
                title: 'Bảo Mật Thông Tin',
                content:
                    'Chúng tôi cam kết bảo mật thông tin cá nhân của bạn. Không chia sẻ thông tin đăng nhập hoặc dữ liệu công việc của bạn với bất kỳ ai khác.',
              ),
              Divider(),
              AttentionItem(
                title: 'Điều Khoản Sử Dụng',
                content:
                    'Trước khi sử dụng ứng dụng, bạn cần đọc và đồng ý với Điều khoản sử dụng. Điều khoản này quy định các quyền và trách nhiệm của bạn khi sử dụng ứng dụng của chúng tôi.',
              ),
              Divider(),
              AttentionItem(
                title: 'Liên hệ',
                content:
                    'Nếu bạn có bất kỳ câu hỏi hoặc phản hồi nào về ứng dụng hoặc về các vấn đề liên quan đến bảo mật và quyền riêng tư, hãy liên hệ với chúng tôi qua địa chỉ email hoặc số điện thoại được cung cấp trong ứng dụng.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AttentionItem extends StatelessWidget {
  final String title;
  final String content;

  const AttentionItem({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          content,
          style: const TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 16.0),
      ],
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Upload multiple files")),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 20,
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
              height: 20,
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
                                  fontWeight: FontWeight.bold, fontSize: 20)),
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
                                child: const Icon(Icons.delete,
                                    color: Colors.white),
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
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Your name'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MaterialButton(
                color: Colors.blue,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                height: 50,
                onPressed: () async {
                  for (int i = 0; i < images.length; i++) {
                    String url = await uploadFile(images[i]);
                    downloadUrls.add(url);
                    if (i == images.length - 1) {
                      storeEntry(downloadUrls, nameController.text);
                    }
                  }
                },
                child: const Text("Upload"),
              ),
            )
          ]),
        ),
      ),
    );
  }

  List<String> downloadUrls = [];
  final ImagePicker _picker = ImagePicker();
  getMultiImage() async {
    final List<XFile> pickedImages = await _picker.pickMultiImage();
    for (var e in pickedImages) {
      images.add(File(e.path));
    }
    setState(() {});
  }

  Future<void> takePicture() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        // If the user captures an image, add it to the list of images.
        images.add(File(image.path));
        setState(() {});
      }
    } catch (e) {null;}
  }

  Future<String> uploadFile(File file) async {
    final metaData = SettableMetadata(contentType: 'image/jpeg');
    final storageRef = FirebaseStorage.instance.ref();
    Reference ref =
        storageRef.child('Report/${DateTime.now().microsecondsSinceEpoch}.jpg');
    final uploadTask = ref.putFile(file, metaData);
    final taskSnapshot =
        await uploadTask.whenComplete(() {});
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }

  storeEntry(List<String> imageUrls, String name) {
    FirebaseFirestore.instance
        .collection('Result')
        .add({'image': imageUrls, 'name': name}).then((value) {
      Get.snackbar('Success', 'Data is stored successfully');
    });
  }
}
