import 'dart:io';

import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:calorie_counter/modules/main_screens/report/report_controller.dart';

import '../../../../app_config.dart';
import 'discount_comparison_chart.dart';

class CurrentWeight extends StatelessWidget {
  const CurrentWeight({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportController>(
      builder: (ctrl) {
        return CommonClass.commonContainerClass(
          margin: EdgeInsets.only(bottom: 17),
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VSpace(16),

            /// Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
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
                    AppText(
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
                    image: FileImage(File(ctrl.image!.path)),
                    fit: BoxFit.cover,
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
                      (e) => CommonClass.buildFilterChip(
                    e.value,
                    isSelected: e.value == ctrl.selectedChartMonth,
                    onTap: () => monthTap(ctrl, e.value),
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 16),
            VSpace(16),
          ],
        ),);
      }
    );
  }
  void monthTap(ReportController ctrl, title) {
    ctrl.monthTap(title);
  }

}
