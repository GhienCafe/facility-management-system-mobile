import 'package:FMS/res/color/colors.dart';
import 'package:flutter/material.dart';

class QRResultRoom extends StatelessWidget {
  final String data;

  QRResultRoom({required this.data});

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
          "Thông Tin Phòng",
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

