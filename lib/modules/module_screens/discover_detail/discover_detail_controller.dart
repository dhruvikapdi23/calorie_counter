import 'dart:developer';

import 'package:calorie_counter/models/food_item.dart';
import 'package:calorie_counter/utils/app_session_key.dart';

import '../../../app_config.dart';
import '../../../models/meal_item_model.dart';

class DiscoverDetailController extends GetxController {
  TextEditingController search = TextEditingController();
  dynamic foodItem;
  final tableData = [
    {"title": "Breakfast", "meal": "Veggie Omelette With Spinach, Tomatoes, And Feta"},
    {"title": "Lunch", "meal": "Grilled Chicken With Quinoa And Roasted Vegetables"},
    {"title": "Dinner", "meal": "Salmon With Broccoli And Cauliflower Rice"},
    {"title": "Snack", "meal": "Greek Yogurt With Berries"},
  ];


  @override
  void onInit() {
    // TODO: implement onInit
    foodItem = Get.arguments;
    update();
    super.onInit();
  }
}
