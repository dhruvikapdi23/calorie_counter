import 'dart:developer';

import 'package:calorie_counter/models/food_item.dart';
import 'package:calorie_counter/utils/app_session_key.dart';

import '../../../app_config.dart';
import '../../../models/meal_item_model.dart';

class FilterController extends GetxController {
  TextEditingController search = TextEditingController();
  String displayOfResultByOrder = Fonts.alphabetical;


  @override
  void onInit() {
    // TODO: implement onInit

    update();
    super.onInit();
  }


  selectOrderTap(val){
    displayOfResultByOrder =val;
    update();
  }
}
