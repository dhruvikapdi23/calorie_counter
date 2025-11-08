import '../../../app_config.dart';
import '../../../models/meal_item_model.dart';
import '../../../models/meals_category_model.dart';
import 'meals_controller.dart';

class MealsWidgetClass{


  static Widget buildMealCard(MealsModel meal, GestureTapCallback? favTap) =>
      Container(
        padding: const EdgeInsets.all(12),
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
        child: IntrinsicHeight(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Image.asset(
                  meal.image!,
                  height: 84,
                  width: 84,
                  fit: BoxFit.cover,
                ),
              ),
              HSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            meal.title!.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppCss.soraMedium13,
                          ),
                        ),
                        HSpace(16),
                        InkWell(
                          onTap: favTap,
                          child: SvgPicture.asset(
                            meal.isFavourite == true
                                ? AppSvg.favHeart
                                : AppSvg.heart,
                          ),
                        ),
                      ],
                    ),
                    VSpace(4),
                    Text(
                      "${meal.kcal} kcal",
                      style: AppCss.soraRegular12.copyWith(
                        color: AppColors.gary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          nutrient("Carbs", "${meal.carbs}g"),
                          VerticalDivider(
                            width: 0,
                            color: AppColors.gary,
                            thickness: .4,
                            endIndent: 3,
                            indent: 3,
                          ).paddingSymmetric(horizontal: 17, vertical: 5),
                          nutrient("Fat", "${meal.fat}g"),
                          VerticalDivider(
                            width: 0,
                            color: AppColors.gary,
                            thickness: .4,
                            endIndent: 3,
                            indent: 3,
                          ).paddingSymmetric(horizontal: 17, vertical: 5),
                          nutrient("Protein", "${meal.protein}g"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  static Widget nutrient(String label, String value) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: AppCss.soraRegular12.copyWith(color: AppColors.gary)),
      VSpace(2),
      Text(value, style: AppCss.soraMedium13),
    ],
  );

  static Widget buildCategoryList(MealsController ctrl,Function? onTapFunction) => SizedBox(
    height: 95,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: AppArray.categories.length,
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(width: 15),
      itemBuilder: (context, index) {
        MealCategoryModel item = AppArray.categories[index];
        final isSelected = item.name == ctrl.selectedCategory?.name;

        return GestureDetector(
          onTap:() => onTapFunction!(item),
          child: Column(
            children: [
              Container(
                height: 68,
                width: 68,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: isSelected ? AppColors.primaryColor : Colors.white,
                  ),
                  boxShadow: isSelected
                      ? null
                      : [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: .05),
                      offset: Offset(0, 10),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Center(child: SvgPicture.asset(item.icon!, height: 28)),
              ),
              const SizedBox(height: 8),
              Text(item.name!, style: AppCss.soraRegular12),
            ],
          ),
        );
      },
    ),
  );

  static Widget buildMealSection(MealItemModel section, Function(int)? favTap) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(section.title!, style: AppCss.soraSemiBold16),
              TextButton(
                onPressed: () => Navigation.toNamed(RouteName.mealDetail,arguments: section),
                child: Text(
                  "View all",
                  style: AppCss.soraSemiBold13.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Column(
            children: section.meals!
                .getRange(0, 2)
                .toList()
                .asMap()
                .entries
                .map(
                  (meal) => MealsWidgetClass.buildMealCard(meal.value, () => favTap!(meal.key)),
            )
                .toList(),
          ),


        ],
      );


}