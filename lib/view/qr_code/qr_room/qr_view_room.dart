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
            colors: [
              Color(0xff0e4e86),
              Color(0xff1461a2),
              Color(0xff2e7abb),
            ],
          )),
        ),
        title: const Text(
          "Thông Tin Phòng",
          style: TextStyle(
            color: AppColor.whiteColor,
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
