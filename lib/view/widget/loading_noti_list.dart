import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingListNotification extends StatefulWidget {
  const LoadingListNotification({super.key});

  @override
  State<LoadingListNotification> createState() => _LoadingListNotificationState();
}

class _LoadingListNotificationState extends State<LoadingListNotification> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[500]!,
      child: ListView.builder(
        itemCount: 4, // Number of shimmer items
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: double.infinity,
              height: 110.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),

            ),
          );
        },
      ),
    );
  }
}
