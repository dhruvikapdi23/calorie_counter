import 'package:calorie_counter/models/meals_category_model.dart';
import '../../../app_config.dart';

class HomeController extends GetxController {
  int currentStep = 0; // example: currently at step 4 of 14
  MealCategoryModel? selectedCategory;
  
  DateTime currentDate =DateTime.now();


  double waterLevel =0.0;
  double dailyGoal =0;
  double glass =0;
  
  
  previousBack(){
    currentDate = currentDate.subtract(Duration(days: 1));
    update();
  }

  nextTap(){
    currentDate = currentDate.add(Duration(days: 1));
    update();
  }
}
