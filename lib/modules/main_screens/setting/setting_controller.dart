import 'dart:developer';

import 'package:calorie_counter/utils/app_session_key.dart';

import '../../../app_config.dart';
import 'layouts/logout_delete_account_layout.dart';

class SettingController extends GetxController {
  int currentStep = 0; // example: currently at step 4 of 14

  nextTo() {
    currentStep++;
    update();
  }

  onTapFunction(title) {
    if (title == Fonts.profileInformation) {
      Get.toNamed(RouteName.profileInformation);
    } else if (title == Fonts.generalSettings) {
      Get.toNamed(RouteName.generalInformation);
    } else if (title == Fonts.language) {
      Get.toNamed(RouteName.language);
    } else if (title == Fonts.subscription) {
      Get.toNamed(RouteName.plan);
    }
  }

  logout() {
    AppDialogs.showCommonDialog(LogoutDeleteAccountLayout(
      icon: AppImages.logout,
      title: Fonts.logout.tr,
      description: Fonts.logoutConfirmation.tr,
    ));
  }


}
