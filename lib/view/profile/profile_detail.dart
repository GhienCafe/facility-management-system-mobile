import 'package:flutter/material.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({super.key});

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const RoundedAppBar(),
      body: Container(
          color: Colors.white,
          child: Center(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              elevation: 10.0,
              child: Container(
                width: 300.0,
                height: 300.0,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    // This will hold the Image in the back ground:
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.pink[100]),
                    ),
                    // This is the Custom Shape Container
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      child: Container(
                        color: Colors.red,
                        child: CustomPaint(
                          painter: CustomContainerShapeBorder(
                            height: 200.0,
                            width: 300.0,
                            radius: 50.0,
                          ),
                        ),
                      ),
                    ),
                    // This Holds the Widgets Inside the the custom Container;
                    // Positioned(
                    //   bottom: 10.0,
                    //   child: Container(
                    //     height: 80.0,
                    //     width: 260.0,
                    //     color: Colors.grey.withOpacity(0.6),
                    //     child: null,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          )),
    ));
  }
}

class CustomContainerShapeBorder extends CustomPainter {
  final double height;
  final double width;
  final Color fillColor;
  final double radius;

  CustomContainerShapeBorder({
    this.height = 400.0,
    this.width = 300.0,
    this.fillColor = Colors.white,
    this.radius = 50.0,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0.0, -radius);
    path.lineTo(0.0, -(height - radius));
    path.conicTo(0.0, -height, radius, -height, 1);
    path.lineTo(width - radius, -height);
    path.conicTo(width, -height, width, -(height + radius), 1);
    path.lineTo(width, -(height - radius));
    path.lineTo(width, -radius);

    path.conicTo(width, 0.0, width - radius, 0.0, 1);
    path.lineTo(radius, 0.0);
    path.conicTo(0.0, 0.0, 0.0, -radius, 1);
    path.close();
    canvas.drawPath(path, Paint()..color = fillColor);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class RoundedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RoundedAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: preferredSize,
      child: LayoutBuilder(builder: (context, constraint) {
        final width = constraint.maxWidth * 8;
        return Stack(
          children: [
            ClipRect(
              child: OverflowBox(
                maxHeight: double.infinity,
                maxWidth: double.infinity,
                child: SizedBox(
                  width: width,
                  height: width,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: width / 2 - preferredSize.height / 2),
                    child: const DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Row(
                  //mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BackButton(),
                    Text(
                      "Title",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
