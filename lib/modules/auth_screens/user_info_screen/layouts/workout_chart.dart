import 'package:calorie_counter/extension/widget_extension.dart';

import 'package:fl_chart/fl_chart.dart';

import '../../../../app_config.dart';

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
