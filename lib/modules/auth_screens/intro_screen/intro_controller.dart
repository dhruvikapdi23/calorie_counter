
import 'dart:developer';

import 'package:calorie_counter/utils/app_session_key.dart';

import '../../../app_config.dart';

class IntroController extends GetxController {
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
}
