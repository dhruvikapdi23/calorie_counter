import 'dart:io';

import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:calorie_counter/modules/main_screens/report/report_controller.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../widgets/custom_animated_circular_chart.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportController>(
      init: ReportController(),
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            toolbarHeight: 72,
            title: Text(
              Fonts.calorieReport.tr,
              style: AppCss.soraSemiBold24.copyWith(color: AppColors.white),
            ),

            actions: [
              CommonClass.commonBgCircleIcon(
                AppSvg.frame,
              ).inkWell(onTap: () => scanTap()),

              HSpace(4),
              CommonClass.commonBgCircleIcon(AppSvg.bell),
              HSpace(16),
            ],
          ),

          body: SingleChildScrollView(
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 26.5,
                    bottom: 12.5,
                  ),
                  margin: EdgeInsets.only(bottom: 17),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withValues(alpha: .05),
                        offset: Offset(0, 10),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        Fonts.dailyProgress.tr,
                        style: AppCss.soraSemiBold24,
                      ),
                      VSpace(10),
                      Row(
                        spacing: 9,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Today,${DateFormat("MMM dd").format(DateTime.now())} ",
                            style: AppCss.soraMedium14.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          SvgPicture.asset(
                            AppSvg.calendar,
                            colorFilter: ColorFilter.mode(
                              AppColors.primaryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                      VSpace(14),
                      Text(
                        Fonts.exerciseAccording.tr,
                        style: AppCss.soraRegular14.copyWith(
                          color: AppColors.gary,
                        ),
                      ),
                      VSpace(30),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            spacing: 4,
                            children: [
                              Row(
                                spacing: 5,
                                children: [
                                  SvgPicture.asset(AppSvg.eaten),
                                  Text(
                                    Fonts.eaten.tr,
                                    style: AppCss.soraRegular14,
                                  ),
                                ],
                              ),
                              Text("1634", style: AppCss.soraMedium24),
                              Text(
                                "kcal",
                                style: AppCss.soraRegular12.copyWith(
                                  color: AppColors.gary,
                                ),
                              ),
                            ],
                          ),

                          AnimatedCircularInnerShadowChart(
                            title: "2560",
                            progress: .45,
                            subtitle: "kcal left",

                            color: AppColors.primaryColor,
                            size: 118,
                          ),
                          Column(
                            spacing: 4,
                            children: [
                              Row(
                                spacing: 5,
                                children: [
                                  SvgPicture.asset(AppSvg.fire),
                                  Text(
                                    Fonts.burned.tr,
                                    style: AppCss.soraRegular14,
                                  ),
                                ],
                              ),
                              Text("265", style: AppCss.soraMedium24),
                              Text(
                                "kcal",
                                style: AppCss.soraRegular12.copyWith(
                                  color: AppColors.gary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      VSpace(16),
                      Row(
                        spacing: 9,
                        children: [
                          Text(
                            Fonts.eaten,
                            style: AppCss.soraRegular16.copyWith(
                              color: AppColors.gary,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              height: 1,
                              color: AppColors.gary,
                              thickness: .6,
                            ),
                          ),
                        ],
                      ),
                      VSpace(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            spacing: 7,
                            children: [
                              AnimatedCircularInnerShadowChart(
                                title: "168g",
                                progress: .40,
                                subtitle: "40%",
                                color: AppColors.red1,
                                //size: 84
                              ),
                              Text(Fonts.carbs.tr, style: AppCss.soraRegular14),
                            ],
                          ),
                          Column(
                            spacing: 7,
                            children: [
                              AnimatedCircularInnerShadowChart(
                                title: "83g",
                                progress: .45,
                                subtitle: "45%",
                                color: AppColors.orange,
                                //size: 84
                              ),
                              Text(
                                Fonts.protein.tr,
                                style: AppCss.soraRegular14,
                              ),
                            ],
                          ),
                          Column(
                            spacing: 7,
                            children: [
                              AnimatedCircularInnerShadowChart(
                                title: "70g",
                                progress: .30,
                                subtitle: "30%",
                                color: AppColors.blue,
                                //size: 84
                              ),
                              Text(Fonts.fat.tr, style: AppCss.soraRegular14),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 17),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withValues(alpha: .05),
                        offset: Offset(0, 10),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VSpace(16),

                      /// Header Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Fonts.currentWeight.tr,
                            style: AppCss.soraSemiBold16,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.lightPrimaryColor,
                              border: Border.all(color: AppColors.primaryColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: SvgPicture.asset(AppSvg.camera),
                          ).inkWell(onTap: () => ctrl.pickImage()),
                        ],
                      ).paddingSymmetric(horizontal: 16),
                      VSpace(12),

                      /// Weight + Modify Button
                      AppTextField(
                        color: AppColors.lightGrey.withValues(alpha: .20),
                        bColor: AppColors.lightGrey.withValues(alpha: .20),

                        bRadius: 12,
                        suffixIcon: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 11,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            spacing: 5,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                AppSvg.edit,
                                height: 14,
                                colorFilter: ColorFilter.mode(
                                  AppColors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                              Text(
                                Fonts.modify.tr,
                                style: AppCss.soraMedium12.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),

                        style: AppCss.soraSemiBold18.copyWith(
                          color: AppColors.black,
                        ),
                        hintText: "100.00 Kg",
                        hintStyle: AppCss.soraSemiBold18.copyWith(
                          color: AppColors.black,
                        ),
                      ).paddingSymmetric(horizontal: 16),

                      if (ctrl.image != null)
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 16),
                          height: 200,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: FileImage(File(ctrl.image!.path!)),
                              fit: BoxFit.cover
                            ),
                          ),
                        ),
                      const SizedBox(height: 16),

                      DiscountComparisonChart(
                        beforeDiscount: 2000,
                        afterDiscount: 80000,
                      ).paddingSymmetric(horizontal: 16),

                      Divider(
                            height: 0,
                            color: AppColors.strokeColor,
                            thickness: .5,
                          )
                          .paddingSymmetric(vertical: 16)
                          .paddingSymmetric(horizontal: 16),

                      /// Duration Filters
                      Wrap(
                        spacing: 7,
                        children: [
                          ...[
                            'All',
                            '1 month',
                            '3 month',
                            '6 month',
                            '1 year',
                          ].asMap().entries.map(
                            (e) => _buildFilterChip(
                              e.value,
                              isSelected: e.value == ctrl.selectedChartMonth,
                              onTap: () => monthTap(ctrl, e.value),
                            ),
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 16),
                      VSpace(16),
                    ],
                  ),
                ),
              ],
            ).paddingAll(16),
          ),
        );
      },
    );
  }

  Widget _buildFilterChip(
    String label, {
    bool isSelected = false,
    GestureTapCallback? onTap,
  }) {
    return Container(
      child: Text(
        label,
        style: AppCss.soraRegular12.copyWith(
          color: isSelected ? Colors.white : AppColors.gary,
        ),
      ),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : AppColors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isSelected ? AppColors.primaryColor : AppColors.strokeColor,
        ),
      ),

      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
    ).inkWell(onTap: onTap);
  }

  void onTapFunction(ReportController ctrl, title) {
    ctrl.categorySelect(title);
  }

  void monthTap(ReportController ctrl, title) {
    ctrl.monthTap(title);
  }

  void scanTap() {
    Get.toNamed(RouteName.scanImage);
  }
}

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
