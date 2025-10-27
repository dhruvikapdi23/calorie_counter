import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/extension/widget_extension.dart';
import 'meals_controller.dart';
import 'meals_widget_class.dart';

class Meals extends StatefulWidget {
  const Meals({super.key});

  @override
  State<Meals> createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MealsController>(
      init: MealsController(),
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            toolbarHeight: 72,
            title: Text(
              Fonts.meals.tr,
              style: AppCss.soraSemiBold24.copyWith(color: AppColors.white),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),
                child: AppTextField(
                  color: AppColors.white,
                  onTap: ()=> Get.toNamed(RouteName.search),

                  bRadius: 12,
                  hintText: Fonts.searchForAFoodItem.tr,
                  hintStyle: AppCss.soraRegular14.copyWith(
                    color: AppColors.gary,
                  ),
                  prefixIcon: SvgPicture.asset(
                    AppSvg.search1,
                  ).paddingSymmetric(horizontal: 14),
                  suffixIcon: SvgPicture.asset(
                    AppSvg.filter,
                  ).paddingSymmetric(horizontal: 14),
                ),
              ),
            ),
            actions: [
              CommonClass.commonBgCircleIcon(AppSvg.frame).inkWell(onTap: ()=> scanTap()),

              HSpace(4),
              CommonClass.commonBgCircleIcon(AppSvg.bell),
              HSpace(16),
            ],
          ),

          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Fonts.browseMealsByCategories.tr,
                  style: AppCss.soraSemiBold16,
                ),
                VSpace(12),
                MealsWidgetClass.buildCategoryList(
                  ctrl,
                  (item) => onTapFunction(ctrl, item),
                ),
                VSpace(24),

                ListView.builder(
                  itemCount: AppArray.mealSections.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    return MealsWidgetClass.buildMealSection(
                      AppArray.mealSections[i],
                      (index) {
                        AppArray.mealSections[i].meals![index].isFavourite =
                            !AppArray
                                .mealSections[i]
                                .meals![index]
                                .isFavourite!;
                        setState(() {});
                      },
                    );
                  },
                ),
              ],
            ).paddingAll(16),
          ),
        );
      },
    );
  }

  void onTapFunction(MealsController ctrl, title) {
    ctrl.categorySelect(title);
  }

  void scanTap() {
    Get.toNamed(RouteName.scanImage);
  }
}
