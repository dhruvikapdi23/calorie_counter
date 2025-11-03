import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/extension/widget_extension.dart';


import '../../../widgets/custom_animated_circular_chart.dart';
import 'food_detail_controller.dart';

class FoodDetail extends StatelessWidget {
  const FoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodDetailController>(
      init: FoodDetailController(),
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              spacing: 10,
              children: [
                CommonBackCircle(onTap: () => Get.back()),
                Text(
                  ctrl.foodItem != null ? ctrl.foodItem!.name.tr : "",
                  style: AppCss.soraMedium16,
                ),
              ],
            ),
          ),
          bottomNavigationBar: appButton(
            Fonts.addFood.tr,
            onTap: ()=>Get.toNamed(RouteName.addFood)
          ).padding(horizontal: 16, bottom: 30),
          body: ctrl.foodItem != null
              ? ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(ctrl.foodItem!.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: 228,
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(9),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(AppSvg.favHeart),
                        ),
                      ],
                    ),
                    VSpace(24),
                    Text(
                      Fonts.dailyWeightLossPlan.tr,
                      style: AppCss.soraSemiBold16,
                    ),
                    VSpace(14),
                    Row(
                          children: [
                            Text(
                              Fonts.highProteinFibreHealthyFats.tr,
                              style: AppCss.soraSemiBold16.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        )
                        .paddingAll(12)
                        .decorated(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.primaryColor,
                            width: 1.3,
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
                      child: Row(spacing: 8,
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
                                "g",style: AppCss.soraRegular15.copyWith(color: AppColors.gary),
                              ).paddingSymmetric(horizontal: 14,vertical: 10),
                            ),
                          ),
                          Text("65 kcal",style: AppCss.soraRegular15.copyWith(
                            color: AppColors.gary,
                          ),).paddingAll(15).decorated(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.strokeColor)
                          )
                        ],
                      ),
                    )
                  ],
                )
              : null,
        );
      },
    );
  }
}
