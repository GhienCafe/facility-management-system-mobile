import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingTaskPage extends StatefulWidget {
  const LoadingTaskPage({super.key});

  @override
  State<LoadingTaskPage> createState() => _LoadingTaskPageState();
}

class _LoadingTaskPageState extends State<LoadingTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              width: double.infinity,
              height: 270.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              width: double.infinity,
              height: 100.0,
            ),
            const Padding(
              padding:
              EdgeInsets.symmetric(vertical: 10.0),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              width: double.infinity,
              height: 100.0,
            ),
            const Padding(
              padding:
              EdgeInsets.symmetric(vertical: 10.0),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              width: double.infinity,
              height: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
