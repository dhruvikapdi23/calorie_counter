import 'dart:developer';

import 'package:calorie_counter/utils/app_preferences.dart';
import 'package:calorie_counter/utils/app_session_key.dart';

import '../../../app_config.dart';
import '../user_info_screen/user_info_controller.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    checkData();
    super.onInit();
  }

  void checkData() {
    Future.delayed(const Duration(seconds: 3), () async {
      //this is used to check any language has been stored or not if there then fetch and update it
      String? lang = AppPreference.getValue(Session.language);
      if (lang != null) {

        UserInfoController languageController =
            Get.isRegistered<UserInfoController>()
            ? Get.find<UserInfoController>()
            : Get.put(UserInfoController());
        log("SLAS :${lang}");

        languageController.selectedLanguage = AppArray.languageList.firstWhere(
              (element) => element.title == lang,
          orElse: () => AppArray.languageList.first, // fallback
        );

        languageController.onLanguageSelectTap(
          languageController.selectedLanguage,
        );
        languageController.update();
      }

      Navigation.toNamed(RouteName.introScreen);
    });
  }
}
