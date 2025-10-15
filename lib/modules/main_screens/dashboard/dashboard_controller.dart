import 'dart:developer';

import 'package:calorie_counter/modules/main_screens/meals/meals.dart';
import 'package:calorie_counter/modules/main_screens/setting/setting.dart';
import 'package:calorie_counter/utils/app_session_key.dart';

import '../../../app_config.dart';

class DashboardController extends GetxController {
  int currentStep = 0; // example: currently at step 4 of 14


  List<Widget> get pages => [
    Container(),
    Meals(),
    Container(),
    Container(),
    Setting()
  ];

  nextTo(val) {
    currentStep = val;
    update();
  }


}
