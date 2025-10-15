import 'dart:developer';

import 'package:calorie_counter/models/meals_category_model.dart';
import 'package:calorie_counter/modules/main_screens/meals/meals.dart';
import 'package:calorie_counter/modules/main_screens/setting/setting.dart';
import 'package:calorie_counter/utils/app_session_key.dart';

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
