import 'dart:developer';
import 'dart:math' as math;

import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../../app_config.dart';
import '../../../../widgets/feet_ruler_scaler.dart';
import '../../../../widgets/number_carosuel.dart';
import '../../../../widgets/ruler_scaler.dart';

class WorkOutChart extends StatefulWidget {
  const WorkOutChart({super.key});

  @override
  State<WorkOutChart> createState() => _WorkOutChartState();
}

class _WorkOutChartState extends State<WorkOutChart> {


  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSpace(16),
        SizedBox(
          width: Get.width,
          height: 221,
          child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineTouchData: const LineTouchData(enabled: false),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    color: AppColors.primaryColor,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, bar, index) {
                        final bool isEdge = index == 0 || index == bar.spots.length - 1;

                        if (spot.y == 75.0 || spot.y ==31.4) {
                          // visible dot for first & last
                          return FlDotCirclePainter(
                            radius: 6,
                            color: const Color(0xFFFAF4ED),
                            strokeColor: const Color(0xFF8B4A2B),
                            strokeWidth: 2,
                          );
                        } else {
                          // invisible painter for other points (non-null)
                          return FlDotCirclePainter(
                            radius: 0.0,
                            color: Colors.transparent,
                            strokeColor: Colors.transparent,
                            strokeWidth: 0,
                          );
                        }
                      },
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primaryColor.withValues(alpha: .40),
                          AppColors.shadow.withValues(alpha: .0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    spots: const [
                      FlSpot(1, 80),
                      FlSpot(2, 75),
                      FlSpot(3, 68),
                      FlSpot(4, 60),
                      FlSpot(5, 45),
                      FlSpot(6, 31.4),
                      FlSpot(7, 20),
                    ],
                  ),
                ],
                extraLinesData: ExtraLinesData(),
                showingTooltipIndicators: [],
              )
          ),
        ),
        VSpace(26.8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Fonts.healthy.tr,style: AppCss.soraSemiBold18),
            VSpace(12),
            Text(Fonts.healthy1.tr,style: AppCss.soraRegular14,)
          ],
        ).paddingAll(16).decorated(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: .05),
              offset: Offset(0, 10),
              blurRadius: 20
            )
          ]
        )
      ],
    );
  }
}

class TabItem extends StatelessWidget {
  final String title;

  const TabItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Tab(child: Text(title, overflow: TextOverflow.ellipsis));
  }
}

class _FeetRulerPainter extends CustomPainter {
  final double minFeet;
  final double maxFeet;
  final double unitSpacing;

  _FeetRulerPainter({
    required this.minFeet,
    required this.maxFeet,
    required this.unitSpacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint tickPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.2;

    final TextStyle labelStyle = const TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );

    const double baseLineY = 50;
    const double labelOffset = 6;

    // total inches across full range
    final int totalInches = ((maxFeet - minFeet) * 12).round();

    for (int i = 0; i <= totalInches; i++) {
      final double valueInFeet = minFeet + i / 12.0;
      final double x = i * unitSpacing;

      // tick type
      bool isMajorTick = (i % 12 == 0); // full foot
      bool isMidTick = (i % 6 == 0); // half foot

      final double tickHeight = isMajorTick
          ? 25
          : isMidTick
          ? 18
          : 10;

      // draw tick
      canvas.drawLine(
        Offset(x, baseLineY - tickHeight),
        Offset(x, baseLineY),
        tickPaint,
      );

      // draw label (for every inch)
      int feet = valueInFeet.floor();
      int inches = ((valueInFeet - feet) * 12).round();
      if (inches == 12) {
        feet += 1;
        inches = 0;
      }

      final String label = "$feet'${inches.toString()}";

      final textPainter = TextPainter(
        text: TextSpan(text: label, style: labelStyle),
        textDirection: TextDirection.ltr,
      )..layout();

      textPainter.paint(
        canvas,
        Offset(
          x - textPainter.width / 2,
          baseLineY + labelOffset,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}