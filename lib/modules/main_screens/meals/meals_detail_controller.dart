
import '../../../app_config.dart';
import '../../../models/meal_item_model.dart';

class MealsDetailController extends GetxController {

  MealItemModel? mealItemModel;

  @override
  void onInit() {
    // TODO: implement onInit
    mealItemModel = Get.arguments;
    update();
    super.onInit();
  }

  favTap(index){
    mealItemModel!.meals![index].isFavourite =!mealItemModel!.meals![index].isFavourite!;
    update();
  }

}
