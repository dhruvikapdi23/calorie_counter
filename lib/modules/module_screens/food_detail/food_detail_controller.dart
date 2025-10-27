import 'dart:developer';

import 'package:calorie_counter/models/food_item.dart';
import 'package:calorie_counter/utils/app_session_key.dart';

import '../../../app_config.dart';
import '../../../models/meal_item_model.dart';

class FoodDetailController extends GetxController {
  TextEditingController search = TextEditingController();
  FoodItem? foodItem;


  @override
  void onInit() {
    // TODO: implement onInit
    foodItem = Get.arguments;
    update();
    super.onInit();
  }
}
