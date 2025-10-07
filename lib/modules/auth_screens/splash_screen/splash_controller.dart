import 'dart:developer';


import 'package:calorie_counter/utils/app_session_key.dart';

import '../../../app_config.dart';
import '../user_info_screen/user_info_controller.dart';

class SplashController extends GetxController {
  final storage = GetStorage();

  @override
  void onInit() {
    checkData();
    super.onInit();
  }

  void checkData() {
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        String? lang = storage.read(Session.language);
        if (lang != null) {
          UserInfoController languageController =
          Get.isRegistered<UserInfoController>()?Get.find<UserInfoController>(): Get.put(UserInfoController());
          languageController.selectedLanguage = AppArray
              .languageList
              .where((element) => element['title'] == lang)
              .first;
          languageController.onLanguageSelectTap(languageController.selectedLanguage);

          log("languageController.selectedLanguage :${languageController.selectedLanguage}");
          languageController.update();

        }

Get.toNamed(RouteName.introScreen);
      },
    );
  }
}
