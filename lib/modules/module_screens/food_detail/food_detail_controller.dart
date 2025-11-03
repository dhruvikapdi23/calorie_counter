import 'package:calorie_counter/models/food_item.dart';

import '../../../app_config.dart';

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
