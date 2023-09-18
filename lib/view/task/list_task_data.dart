import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DataListWidget extends StatefulWidget {
  final RxList<dynamic> items;

  DataListWidget(this.items);

  @override
  _DataListWidgetState createState() => _DataListWidgetState();
}

class _DataListWidgetState extends State<DataListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final item = widget.items[index];
        return ListTile(
          title: Text(item),
        );
      },
    );
  }
}
