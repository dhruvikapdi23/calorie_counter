import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../app_config.dart';

class DiscountComparisonChart extends StatelessWidget {
  final double beforeDiscount;
  final double afterDiscount;

  const DiscountComparisonChart({
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
          axisLine: const AxisLine(width: 0.5),
          labelStyle: AppCss.soraMedium12,
        ),
        primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 60,
          interval: 20,
          axisLine: const AxisLine(width: 0.5),
          labelStyle: AppCss.soraMedium12,
          majorGridLines: weeklyData.isNotEmpty
              ? const MajorGridLines(width: 0)
              : MajorGridLines(),
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
            width: 0.7,
            spacing: .18,
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
