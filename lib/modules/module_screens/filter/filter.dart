import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/extension/widget_extension.dart';

import 'filter_controller.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(
      init: FilterController(),
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              spacing: 10,
              children: [
                CommonBackCircle(onTap: () => Get.back()),
                Text(Fonts.filters.tr, style: AppCss.soraMedium16),
              ],
            ),
          ),
          bottomNavigationBar: Row(
            spacing: 12,
            children: [
              Expanded(
                child: appButton(
                  Fonts.reset.tr,
                  color: AppColors.white,
                  bColor: AppColors.gary,
                  textColor: AppColors.gary,
                  onTap: ()=>Get.back()
                ),
              ),
              Expanded(child: appButton(Fonts.save.tr,onTap: () => saveTap())),
            ],
          ).padding(horizontal: 16, bottom: 30),
          body: ListView(
            padding: EdgeInsets.all(16),
            children: [
              Text(Fonts.selectCategory.tr, style: AppCss.soraSemiBold16),
              VSpace(16),

              VSpace(24),
              Text(
                Fonts.displayOfResultByOrder.tr,
                style: AppCss.soraSemiBold16,
              ),
              VSpace(16),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
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
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child:
                          CommonClass.displayOfResultByOrder(
                            Fonts.alphabetical,
                            ctrl.displayOfResultByOrder,
                          ).inkWell(
                            onTap: () => selectOrder(ctrl, Fonts.alphabetical),
                          ),
                    ),
                    Expanded(
                      child: CommonClass.displayOfResultByOrder(
                        Fonts.calorie,
                        ctrl.displayOfResultByOrder,
                      ).inkWell(onTap: () => selectOrder(ctrl, Fonts.calorie)),
                    ),
                  ],
                ),
              ),
              VSpace(24),
              Text(Fonts.caloriesPerGrams.tr, style: AppCss.soraSemiBold16),
              VSpace(16),
              Container(
                padding: EdgeInsets.symmetric(horizontal:12,vertical: 16),
                decoration: BoxDecoration(
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
                child: Column(
                  children: [
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 8,

                        inactiveTrackColor: AppColors.lightGrey.withValues(
                          alpha: .20,
                        ),
                        thumbColor: Colors.transparent,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 0.0,
                        ),
                      ),
                      child: Slider(
                        activeColor: AppColors.primaryColor,

                        value: 1205,
                        onChanged: (value) {},
                        min: 0,
                        max: 4000,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    VSpace(13),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonClass.caloriesGram(Fonts.min, "3"),
                        CommonClass.caloriesGram(Fonts.max, "1205"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void selectOrder(FilterController ctrl, val) {
    ctrl.selectOrderTap(val);
  }

  void saveTap() {
    Get.back();
  }
}
