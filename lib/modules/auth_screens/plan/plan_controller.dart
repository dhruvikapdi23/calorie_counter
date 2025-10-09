import 'dart:developer';

import 'package:calorie_counter/utils/app_session_key.dart';

import '../../../app_config.dart';

class PlanController extends GetxController {
  int currentStep = 0; // example: currently at step 4 of 14
  String selectedPlan = "monthly";


  nextTo() {
    currentStep++;
    update();
  }

  selectPlan(v) {
    selectedPlan =v;
    update();
  }


}
