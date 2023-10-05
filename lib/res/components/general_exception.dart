import 'package:flutter/material.dart';
import 'package:FMS/res/color/colors.dart';

class GeneralExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const GeneralExceptionWidget({super.key, required this.onPress});

  @override
  State<GeneralExceptionWidget> createState() => _GeneralExceptionWidgetState();
}

class _GeneralExceptionWidgetState extends State<GeneralExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.cloud_off,
            color: AppColor.redColor,
            size: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Center(
                child: Text(
              "Không Có Kết Quả \n Hãy Thử Lại",
              // style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            )),
          ),
          SizedBox(
            height: h * 0.05,
          ),
          InkWell(
            onTap: widget.onPress,
            child: Container(
              height: 44,
              width: 160,
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                  child: Text(
                "Retry",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.white),
              )),
            ),
          )
        ],
      ),
    );
  }
}
