import 'dart:developer';

import 'package:calorie_counter/screens/auth_screens/user_info_screen/layouts/gender_selection.dart';
import 'package:calorie_counter/screens/auth_screens/user_info_screen/layouts/motivate_selection.dart';
import 'package:calorie_counter/utils/app_session_key.dart';

import '../../../app_config.dart';
import 'layouts/activity_level_selection.dart';
import 'layouts/language_selection.dart';
import 'layouts/main_goal_selection.dart';
import 'layouts/push_up_selection.dart';
import 'layouts/weekly_workout_selection.dart';

class UserInfoController extends GetxController {
  int currentStep = 0; // example: currently at step 4 of 14
  String? gender; // example: currently at step 4 of 14
  String? weeklyWorkOut; // example: currently at step 4 of 14
  String? mainGoal; // example: currently at step 4 of 14
  String? motivate; // example: currently at step 4 of 14
  String? pushUp; // example: currently at step 4 of 14
  String? activityLevel; // example: currently at step 4 of 14
  final PageController pageController = PageController();
  dynamic selectedLanguage;

  // List of pages/screens
  List<Widget> get pages => [
    GenderSelection(gender: gender, onTap: (p0) => genderSelect(p0)),
    LanguageSelection(onTap: (p0) =>onLanguageSelectTap(p0), language:selectedLanguage!= null? selectedLanguage["code"]:null),
    WeeklyWorkOutSelection(onTap: (p0) =>weeklyWorkOutSelect(p0), option:weeklyWorkOut),
    MainGoalSelection(onTap: (p0) =>mainGoalSelect(p0), option:mainGoal),
    MotivateSelection(onTap: (p0) =>motivateSelect(p0), option:motivate),
    PushUpSelection(onTap: (p0) =>pushUpSelect(p0), option:pushUp),
    ActivityLevelSelection(onTap: (p0) =>activityLevelSelect(p0), option:activityLevel)

  ];

  //on language select
  onLanguageSelectTap(lan) async {
    selectedLanguage = lan;
    final storage = GetStorage();
    log("selectedLanguage :$selectedLanguage");
    Locale? locale = selectedLanguage['locale'];

    String lanCode = selectedLanguage["code"];
    log("Lan :$locale");
    storage.write(Session.languageCode, lanCode);
    storage.write(Session.language, selectedLanguage["title"]);
    update();

    log("locale:$lanCode");
    Get.updateLocale(locale!);
    Get.forceAppUpdate();
  }

  genderSelect(val) {
    gender = val;
    update();
  }

  weeklyWorkOutSelect(val) {
    weeklyWorkOut = val['title'];
    update();
  }

  mainGoalSelect(val) {
    mainGoal = val['title'];
    update();
  }

  motivateSelect(val) {
    motivate = val['title'];
    update();
  }

  pushUpSelect(val) {
    pushUp = val['title'];
    update();
  }

  activityLevelSelect(val) {
    activityLevel = val['title'];
    update();
  }

  nextTo() {
    if (currentStep < 15) {
      currentStep++;
      pageController.nextPage(duration: Duration(milliseconds: 200), curve:Curves.bounceIn);
    }
    update();
  }
}
