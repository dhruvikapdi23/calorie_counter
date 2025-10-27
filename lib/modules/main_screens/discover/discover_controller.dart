import 'dart:developer';

import 'package:calorie_counter/models/meals_category_model.dart';
import 'package:calorie_counter/modules/main_screens/meals/meals.dart';
import 'package:calorie_counter/modules/main_screens/setting/setting.dart';
import 'package:calorie_counter/utils/app_session_key.dart';

import '../../../app_config.dart';

class DiscoverController extends GetxController {
  int currentStep = 0; // example: currently at step 4 of 14
MealCategoryModel? selectedCategory;


  nextTo(val) {
    currentStep = val;
    update();
  }

categorySelect(val){
    selectedCategory =val;
    update();
}
}
