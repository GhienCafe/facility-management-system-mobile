import 'package:FMS/res/color/colors.dart';
import 'package:flutter/material.dart';

class QRResultAsset extends StatelessWidget {
  final String data;

  QRResultAsset({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFACCCC), Color(0xFFF6EFE9)],
              )),
        ),
        title: const Text(
          "Thông Tin Thiết Bị",
          style: TextStyle(
            color: AppColor.primaryColor,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Center(
        child: Text('Scanned Data: $data'),
      ),
    );
  }
}

