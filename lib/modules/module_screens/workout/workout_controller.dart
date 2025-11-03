
import 'package:calorie_counter/models/exercise_model.dart';
import 'package:calorie_counter/models/food_item.dart';

import '../../../app_config.dart';


class WorkoutController extends GetxController {
  TextEditingController search = TextEditingController();
  FoodItem? foodItem;
  DateTime dateTime = DateTime.now();
  List<ExerciseModel> exerciseList = [];

  ExerciseModel? selected;

  @override
  void onInit() {
    // TODO: implement onInit
    exerciseList = AppArray.exerciseList
        .map((e) => ExerciseModel.fromJson(e))
        .toList();

    update();
    super.onInit();
  }

  selectDate(data) {
    dateTime = data;
    update();
  }

  selectExercise(data) {
    selected = data;
    update();
  }

  startExercise() {
    if (selected != null) {
      Get.toNamed(RouteName.exerciseDetail, arguments: selected);
    } else {
      Get.snackbar("Alert!", "Select Exercise");
    }
  }
}
