
import 'package:calorie_counter/models/meals_category_model.dart';

import '../../../app_config.dart';

class MealsController extends GetxController {
  int currentStep = 0; // example: currently at step 4 of 14
  MealCategoryModel? selectedCategory;

  categorySelect(val) {
    selectedCategory = val;
    update();
  }
}
