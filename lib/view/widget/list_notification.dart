import 'package:FMS/res/color/colors.dart';
import 'package:flutter/material.dart';

List<Map<String, String>> notifications = [
  {'title': 'John', 'description': 'Team A', 'status': 'not read'},
  {'title': 'John1', 'description': 'Team A1', 'status': 'read'},
  {'title': 'John2', 'description': 'Team A2', 'status': 'not read'},
  {'title': 'John3', 'description': 'Team A3', 'status': 'read'},
  {'title': 'John4', 'description': 'Team A4', 'status': 'read'},
];

class NotificationPopUp extends StatelessWidget {
  const NotificationPopUp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BackButton(color: AppColor.primaryColor),
                    Text("Thông Báo", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: notifications.length,
              itemBuilder: (BuildContext context, int index) {
                final notification = notifications[index];
                final isRead = notification['status'] == 'read';

                return Container(
                  height: 60,
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: isRead ? Color(0xA6B7AAAA) : AppColor.primaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(notification['title']!, style: TextStyle(color: isRead ? Colors.black : AppColor.whiteColor)),
                          Text(notification['description']!, style: TextStyle(color: isRead ? Colors.black : AppColor.whiteColor)),
                        ],
                      ),
                      if (!isRead) Icon(Icons.notification_important, color: AppColor.whiteColor),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
