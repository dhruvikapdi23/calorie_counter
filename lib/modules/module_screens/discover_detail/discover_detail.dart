import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/extension/widget_extension.dart';

import '../../../widgets/custom_animated_circular_chart.dart';
import 'discover_detail_controller.dart';

class DiscoverDetail extends StatelessWidget {
  const DiscoverDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DiscoverDetailController>(
      init: DiscoverDetailController(),
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              spacing: 10,
              children: [
                CommonBackCircle(onTap: () => Get.back()),
                AppText(ctrl.foodItem != null ?ctrl.foodItem['title']:"", style: AppCss.soraMedium16),
              ],
            ),
          ),

          body: ctrl.foodItem != null
              ? ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(ctrl.foodItem['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 192,
                    ),
                    VSpace(24),
                    Text(
                      Fonts.dailyWeightLossPlan.tr,
                      style: AppCss.soraSemiBold16,
                    ),
                    VSpace(14),
                    Container(
                      padding: EdgeInsets.symmetric(vertical:12,horizontal: 20),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonClass.discoverDetailFeature("High protein, fiber, healthy fats"),
                          CommonClass.discoverDetailFeature("3 meals + 1 snack per day"),
                        ],
                      ),
                    ),
                    VSpace(24),
                    Text(
                      Fonts.dailyMealBreakdown.tr,
                      style: AppCss.soraSemiBold16,
                    ),
                    VSpace(16),
                    Container(

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),

                      ),
                      child: Table(
                        columnWidths: const {
                          0: FlexColumnWidth(1.2),
                          1: FlexColumnWidth(2),
                        },
                        border: TableBorder.all(
                          color: AppColors.strokeColor,
                          borderRadius: BorderRadius.circular(12),
                          width: 1,
                        ),
                        children: [
                          // Header Row
                          TableRow(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            children: [
                              _buildHeaderCell("Aircraft Size"),
                              _buildHeaderCell("What To Eat"),
                            ],
                          ),

                          // Data Rows
                          for (var row in ctrl.tableData)
                            TableRow(

                              children: [
                                _buildDataCell(row["title"]!,isLabel: true),
                                _buildDataCell(row["meal"]!),
                              ],
                            ),
                        ],
                      ),
                    ),
                    VSpace(24),
                    Text(
                      Fonts.dailyMealBreakdown.tr,
                      style: AppCss.soraSemiBold16,
                    ),
                    VSpace(16),
                    Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimatedCircularInnerShadowChart(
                              title: "168g",
                              progress: .40,
                              subtitle: "40%",
                              color: AppColors.red1,
                              //size: 84
                            ),
                            AnimatedCircularInnerShadowChart(
                              title: "83g",
                              progress: .45,
                              subtitle: "45%",
                              color: AppColors.orange,
                              //size: 84
                            ),
                            AnimatedCircularInnerShadowChart(
                              title: "70g",
                              progress: .30,
                              subtitle: "30%",
                              color: AppColors.blue,
                              //size: 84
                            ),
                          ],
                        )
                        .padding(all: 16)
                        .decorated(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withValues(alpha: .05),
                              offset: Offset(0, 10),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                    VSpace(24),
                    Text(Fonts.addExtraMeal.tr, style: AppCss.soraSemiBold16),
                    VSpace(16),
                    IntrinsicHeight(
                      child: Row(
                        spacing: 8,
                        children: [
                          Expanded(
                            child: AppTextField(
                              color: AppColors.white,
                              controller: ctrl.search,
                              bRadius: 12,

                              hintText: Fonts.searchFood.tr,
                              hintStyle: AppCss.soraRegular14.copyWith(
                                color: AppColors.gary,
                              ),
                              suffixIcon: Text(
                                textAlign: TextAlign.end,
                                "g",
                                style: AppCss.soraRegular15.copyWith(
                                  color: AppColors.gary,
                                ),
                              ).paddingSymmetric(horizontal: 14, vertical: 10),
                            ),
                          ),
                          Text(
                                "65 kcal",
                                style: AppCss.soraRegular15.copyWith(
                                  color: AppColors.gary,
                                ),
                              )
                              .paddingAll(15)
                              .decorated(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppColors.strokeColor,
                                ),
                              ),
                        ],
                      ),
                    ),
                  ],
                )
              : null,
        );
      },
    );
  }

  Widget _buildHeaderCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 12),

      child: Text(
        text,
        style:  AppCss.soraSemiBold14.copyWith(color: AppColors.primaryColor)
      ),
    );
  }

  Widget _buildDataCell(String text,{isLabel =false}) {
    return Padding(

      padding:  EdgeInsets.symmetric(horizontal: 12, vertical:isLabel?32: 18),

      child: Text(
        text,
        textAlign: TextAlign.start,
        style:AppCss.soraRegular13
      ),
    );
  }
}
