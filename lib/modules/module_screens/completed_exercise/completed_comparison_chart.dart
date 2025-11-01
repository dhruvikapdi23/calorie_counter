import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../app_config.dart';

class CompletedComparisonChart extends StatelessWidget {
  final double beforeDiscount;
  final double afterDiscount;

  const CompletedComparisonChart({
    super.key,
    required this.beforeDiscount,
    required this.afterDiscount,
  });

  @override
  Widget build(BuildContext context) {
    final List<_ChartData> weeklyData = [
      _ChartData('Mon', 10),
      _ChartData('Tue', 18),
      _ChartData('Wed', 20),
      _ChartData('Thu', 15),
      _ChartData('Fri', 25),
      _ChartData('Sat', 40),
      _ChartData('Sun', 45),
    ];
    return SizedBox(
      height: 160,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          axisLine: AxisLine(color: Color(0xFF787878).withValues(alpha: .30)),
          // 👈 remove x-axis line
          majorTickLines: const MajorTickLines(width: 0),

          // 👈 remove small ticks
          labelStyle: AppCss.soraMedium12,
        ),
        primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 60,
          interval: 20,
          axisLine: const AxisLine(width: 0),
          // 👈 remove y-axis line
          majorGridLines: const MajorGridLines(width: 0),
          majorTickLines: const MajorTickLines(width: 0),
          // 👈 remove ticks
          minorTickLines: const MinorTickLines(width: 0),
          labelStyle: AppCss.soraMedium12,
        ),
        series: <CartesianSeries<_ChartData, String>>[
          ColumnSeries<_ChartData, String>(
            dataSource: weeklyData,
            isTrackVisible: true,
            trackColor: AppColors.lightGrey.withValues(alpha: .20),
            xValueMapper: (data, _) => data.label,
            yValueMapper: (data, _) => data.value,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(7)),
            color: AppColors.primaryColor,
            width: 0.8,
            spacing: .18,
            pointColorMapper: (data, _) {
              final maxValue = weeklyData
                  .map((e) => e.value)
                  .reduce((a, b) => a > b ? a : b);
              return data.value == maxValue
                  ? AppColors
                        .primaryColor // highlight color for highest bar
                  : AppColors.gary; // normal color for others
            },
            // 🏷️ Add value label on top
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              alignment: ChartAlignment.center,
              labelAlignment: ChartDataLabelAlignment.bottom,
              builder: (data, point, series, pointIndex, seriesIndex) {
                final maxValue = weeklyData
                    .map((e) => e.value)
                    .reduce((a, b) => a > b ? a : b);
                if (data.value != maxValue) return const SizedBox.shrink();

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${data.value.toString()}',
                      style: AppCss.soraSemiBold10.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      'gm\nloss',
                      textAlign: TextAlign.center,
                      style: AppCss.soraMedium8.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                );
              },
              textStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),

            // 🎯 Show label only for highest column
            dataLabelMapper: (data, _) {
              final maxValue = weeklyData
                  .map((e) => e.value)
                  .reduce((a, b) => a > b ? a : b);
              return data.value == maxValue
                  ? '${data.value.toInt()} gm\nloss'
                  : '';
            },
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  final String label;
  final double value;

  _ChartData(this.label, this.value);
}
