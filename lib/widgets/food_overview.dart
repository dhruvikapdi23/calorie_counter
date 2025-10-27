
import 'package:calorie_counter/app_config.dart';

class FoodOverview extends StatelessWidget {
  final String? image,name,weight,calories;
  const FoodOverview({super.key, this.image, this.name, this.weight, this.calories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          Fonts.foodOverview.tr,
          style: AppCss.soraSemiBold16,
        ).marginOnly(bottom: AppDimens.dimen16),
        CommonFoodListLayout(
          image: image?? AppImages.overview,
          name: name?? "Food Name",
          weight: weight?? "0 g",
          calories: calories?? "0 Kcal",
        )
      ]);
  }
}
