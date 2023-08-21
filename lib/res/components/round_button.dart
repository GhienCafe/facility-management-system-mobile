import 'package:flutter/material.dart';
import 'package:FMS/res/color/colors.dart';

// ignore: must_be_immutable
class RoundButton extends StatelessWidget {
  RoundButton({
    super.key,
    this.buttonColor = AppColor.primaryColor,
    this.textColor = AppColor.whiteColor,
    this.width = 60,
    this.height = 50,
    required this.loading,
    required this.onPress,
    required this.title,
  });

  final bool loading;
  final String title;
  double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(50)),
        child: loading
            ? Center(child: CircularProgressIndicator())
            : Center(
                child: Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.white)),
              ),
      ),
    );
  }
}
