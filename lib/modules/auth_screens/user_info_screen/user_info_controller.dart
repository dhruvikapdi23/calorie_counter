import 'dart:developer';

import 'package:calorie_counter/models/acitivity_level_model.dart';
import 'package:calorie_counter/models/language_model.dart';
import 'package:calorie_counter/utils/app_session_key.dart';

import '../../../app_config.dart';
import '../../../models/title_icon_model.dart';
import '../../../models/user_info_title_model.dart';
import 'layouts/activity_level_selection.dart';
import 'layouts/diet_type_selection.dart';
import 'layouts/eat_time_selection.dart';
import 'layouts/gender_selection.dart';
import 'layouts/height_selection.dart';
import 'layouts/language_selection.dart';
import 'layouts/main_goal_selection.dart';
import 'layouts/motivate_selection.dart';
import 'layouts/push_up_selection.dart';
import 'layouts/thank_you.dart';
import 'layouts/time_picker_bottom_sheet.dart';
import 'layouts/weekly_workout_selection.dart';
import 'layouts/weight_selection.dart';
import 'layouts/workout_chart.dart';

class UserInfoController extends GetxController {
  int currentStep = 0;
  String? gender;
  String? weeklyWorkOut;
  String? mainGoal;
  String? motivate;
  String? pushUp;
  String? activityLevel;
  String? dietType;
  final PageController pageController = PageController();
  LanguageModel? selectedLanguage;

  // List of pages/screens
  List<Widget> get pages => [
    GenderSelection(gender: gender, onTap: (p0) => genderSelect(p0)),
    LanguageSelection(
      onTap: (p0) => onLanguageSelectTap(p0),
      language: selectedLanguage?.code,
    ),
    WeeklyWorkOutSelection(
      onTap: (p0) => weeklyWorkOutSelect(p0),
      option: weeklyWorkOut,
    ),
    MainGoalSelection(onTap: (p0) => mainGoalSelect(p0), option: mainGoal),
    MotivateSelection(onTap: (p0) => motivateSelect(p0), option: motivate),
    PushUpSelection(onTap: (p0) => pushUpSelect(p0), option: pushUp),
    ActivityLevelSelection(
      onTap: (p0) => activityLevelSelect(p0),
      option: activityLevel,
    ),
    WeightSelection(),
    HeightSelection(),
    WorkOutChart(),
    DietTypeSelection(onTap: (p0) => dietTypeSelect(p0), option: dietType),
    EatTimeSelection(),
    ThankYou(),
  ];

  //on language select
  onLanguageSelectTap(lan) async {
    selectedLanguage = lan;
    final storage = GetStorage();
    log("selectedLanguage :$selectedLanguage");
    Locale? locale = selectedLanguage!.locale;

    String lanCode = selectedLanguage!.code!;
    log("Lan :$locale");
    storage.write(Session.languageCode, lanCode);
    storage.write(Session.language, selectedLanguage!.title!);
    update();

    log("locale:$lanCode");
    Get.updateLocale(locale!);
    Get.forceAppUpdate();
  }

  genderSelect(val) {
    gender = val;
    update();
  }

  weeklyWorkOutSelect(UserInfoTitleModel val) {
    weeklyWorkOut = val.title;
    update();
  }

  mainGoalSelect(TitleIconModel val) {
    mainGoal = val.title;
    update();
  }

  motivateSelect(TitleIconModel val) {
    motivate = val.title;
    update();
  }

  pushUpSelect(UserInfoTitleModel val) async {
    pushUp = val.title;
    update();
  }

  activityLevelSelect(ActivityLevelModel val) {
    activityLevel = val.title;
    update();
  }

  dietTypeSelect(ActivityLevelModel val) {
    dietType = val.title;
    update();
  }

  nextTo() {
    log("currentStep :$currentStep");
    if (currentStep == 12) {
      Get.toNamed(RouteName.plan);
    } else {
      if (currentStep < 13) {
        currentStep++;
        pageController.nextPage(
          duration: Duration(milliseconds: 200),
          curve: Curves.bounceIn,
        );
      }
    }
    update();
  }

  onBack() {
    if (currentStep == 0) {
      currentStep = 0;
    } else {
      if (currentStep >= 0) {
        currentStep--;
        pageController.previousPage(
          duration: Duration(milliseconds: 200),
          curve: Curves.bounceIn,
        );
      }
    }
    update();
  }

  void showTimePickerBottomSheet(BuildContext context, index) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => TimePickerBottomSheet(
        initialTime: TimeOfDay.now(),
        onTimeSelected: (time) {
          debugPrint('Selected time: ${time.format(context)}');
          // Handle the selected time
        },
      ),
    ).then((value) {
      if (value != null) {
        AppArray.eatTime[index].title = value;
        update();
      }
    });
  }
}
