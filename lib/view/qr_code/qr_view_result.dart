import 'package:flutter/material.dart';

class QRResultPage extends StatelessWidget {
  final String data;

  QRResultPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Result'),
      ),
      body: Center(
        child: Text('Scanned Data: $data'),
      ),
    );
  }
}

