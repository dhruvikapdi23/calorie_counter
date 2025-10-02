
import 'dart:developer';

import 'package:calorie_counter/utils/app_session_key.dart';

import '../../../app_config.dart';

class UserInfoController extends GetxController {
  int currentStep = 0; // example: currently at step 4 of 14
  String? gender; // example: currently at step 4 of 14

  @override
  void onInit() {
    checkData();
    super.onInit();
  }

  void checkData() {
    Future.delayed(
      const Duration(seconds: 3),
      () async {

      },
    );
  }

  genderSelect(val){
    gender = val;
    update();
  }
}
