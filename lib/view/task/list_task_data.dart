import 'package:flutter/material.dart';

class DataListWidget extends StatelessWidget {
  final List<String> items;

  DataListWidget(this.items);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          title: Text(item),
        );
      },
    );
  }
}
