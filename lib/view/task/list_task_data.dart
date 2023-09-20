import 'package:FMS/view/task/task_card.dart';
import 'package:flutter/material.dart';

class DataListWidget extends StatelessWidget {
  final List<String> items;

  DataListWidget(this.items);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return TaskCard(item) ;
            //   ListTile(
            //   title: Text(item),
            // );
          },
        ),
    );
  }
}
