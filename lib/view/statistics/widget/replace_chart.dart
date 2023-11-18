import 'package:FMS/res/color/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ReplaceChart extends StatefulWidget {
  final int total;
  final int process;
  final int waiting;
  final int complete;
  final int reported;
  const ReplaceChart(
      {super.key,
      required this.total,
      required this.process,
      required this.complete,
      required this.reported,
      required this.waiting});

  @override
  State<StatefulWidget> createState() => ReplaceChartState();
}

class ReplaceChartState extends State<ReplaceChart> {
  int touchedIndex = -1;
  double calculatePercentage(int a) {
    if (widget.total != 0) {
      double percentage = (a / widget.total) * 100;
      // Round the percentage to two decimal places
      return double.parse(percentage.toStringAsFixed(2));
    } else {
      // Trả về -1 khi b = 0 để tránh lỗi chia cho 0
      return -1;
    }
  }

  @override
  Widget build(BuildContext context) {
    double processPercentage = calculatePercentage(widget.process);
    double waitingPercentage = calculatePercentage(widget.waiting);
    double completePercentage = calculatePercentage(widget.complete);
    double reportedPercentage = calculatePercentage(widget.reported);
    return AspectRatio(
      aspectRatio: 1.7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: true,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 20,
                  sections: showingSections(
                      processPercentage,
                      waitingPercentage,
                      reportedPercentage,
                      completePercentage),
                ),
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Indicator(
                color: Colors.deepOrangeAccent,
                text: 'Đang Chờ Xử Lý',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Colors.blue,
                text: 'Đang Xử Lý',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Colors.green,
                text: 'Đã Báo Cáo',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Colors.purple,
                text: 'Đã Hoàn Thành',
                isSquare: true,
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections(
    double process,
    double waiting,
    double reported,
    double complete,
  ) {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 90.0 : 70.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.deepOrangeAccent,
            value: waiting,
            title: '$waiting%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: AppColor.whiteColor,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.blue,
            value: process,
            title: '$process%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: AppColor.whiteColor,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.green,
            value: reported,
            title: '$reported%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: AppColor.whiteColor,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.purple,
            value: complete,
            title: '$complete%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: AppColor.whiteColor,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor,
  });
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        )
      ],
    );
  }
}
