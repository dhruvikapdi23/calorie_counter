import 'dart:developer';

import 'package:calorie_counter/utils/app_session_key.dart';

import '../../../app_config.dart';

class SettingController extends GetxController {
  int currentStep = 0; // example: currently at step 4 of 14

  nextTo() {
    currentStep++;
    update();
  }


}
