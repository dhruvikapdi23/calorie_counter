import 'package:calorie_counter/app_config.dart';

import '../models/account_setting_model.dart';
import '../models/acitivity_level_model.dart';
import '../models/dashboard_bottom_model.dart';
import '../models/eat_time_model.dart';
import '../models/gender_model.dart';
import '../models/language_model.dart';
import '../models/setting_model.dart';
import '../models/step_data.dart';
import '../models/title_icon_model.dart';
import '../models/user_info_title_model.dart';
import '../modules/auth_screens/plan/plan.dart';

class AppArray {
  /*static List languageList = [
    {
      "icon": AppSvg.en,
      "title": Fonts.english,
      'locale': const Locale('en', 'US'),
      "code": "en",
    },
    {
      "icon": AppSvg.hi,
      "title": Fonts.hindi,
      'locale': const Locale('hi', 'IN'),
      "code": "hi",
    },
    {
      "icon": AppSvg.de,
      "title": Fonts.deutsch,
      'locale': const Locale('de', 'DE'),
      "code": "de",
    },
    {
      "icon": AppSvg.es,
      "title": Fonts.espanol,
      'locale': const Locale('es', 'ES'),
      "code": "es",
    },
    {
      "icon": AppSvg.fr,
      "title": Fonts.francais,
      'locale': const Locale('fr', 'FR'),
      "code": "fr",
    },
    {
      "icon": AppSvg.pt,
      "title": Fonts.portugues,
      'locale': const Locale('pt', 'PT'),
      "code": "pt",
    },
    {
      "icon": AppSvg.ar,
      "title": Fonts.arabic,
      'locale': const Locale('ar', 'AR'),
      "code": "ar",
    },
  ];*/

  static List<LanguageModel> languageList = [
    LanguageModel(
      icon: AppSvg.en,
      title: Fonts.english,
      locale: Locale('en', 'US'),
      code: 'en',
    ),
    LanguageModel(
      icon: AppSvg.hi,
      title: Fonts.hindi,
      locale: Locale('hi', 'IN'),
      code: 'hi',
    ),
    LanguageModel(
      icon: AppSvg.de,
      title: Fonts.deutsch,
      locale: Locale('de', 'DE'),
      code: 'de',
    ),
    LanguageModel(
      icon: AppSvg.es,
      title: Fonts.espanol,
      locale: Locale('es', 'ES'),
      code: 'es',
    ),
    LanguageModel(
      icon: AppSvg.fr,
      title: Fonts.francais,
      locale: Locale('fr', 'FR'),
      code: 'fr',
    ),
    LanguageModel(
      icon: AppSvg.pt,
      title: Fonts.portugues,
      locale: Locale('pt', 'PT'),
      code: 'pt',
    ),
    LanguageModel(
      icon: AppSvg.ar,
      title: Fonts.arabic,
      locale: Locale('ar', 'AR'),
      code: 'ar',
    ),
  ];

  /*static List genderList = [
    {"title": "Male", "image": AppImages.boy},
    {"title": "Female", "image": AppImages.girl},
  ];*/

  static List<GenderModel> genderList = [
    GenderModel(title: "Male", image: AppImages.boy),
    GenderModel(title: "Female", image: AppImages.girl),
  ];

  static List<UserInfoTitleModel> userInfoTitleSection = [
    UserInfoTitleModel(
      title: Fonts.whatsYourGender,
      desc: Fonts.selectYourGender,
    ),
    UserInfoTitleModel(
      title: Fonts.selectYourLanguage,
      desc: Fonts.selectYourLanguageDesc,
    ),
    UserInfoTitleModel(
      title: Fonts.weeklyWorkoutCount,
      desc: Fonts.weeklyWorkoutCountDesc,
    ),
    UserInfoTitleModel(
      title: Fonts.whatAreYourMainGoals,
      desc: Fonts.whatAreYourMainGoalsDesc,
    ),
    UserInfoTitleModel(
      title: Fonts.whatMotivatesYouTheMost,
      desc: Fonts.whatMotivatesYouTheMostDesc,
    ),
    UserInfoTitleModel(
      title: Fonts.howManyPushUpCanYouDo,
      desc: Fonts.howManyPushUpCanYouDoDesc,
    ),
    UserInfoTitleModel(
      title: Fonts.whatsYourActivityLevel,
      desc: Fonts.whatsYourActivityLevelDesc,
    ),
    UserInfoTitleModel(
      title: Fonts.whatsYourWeight,
      desc: Fonts.whatsYourWeightDesc,
    ),
    UserInfoTitleModel(
      title: Fonts.whatsYourHeight,
      desc: Fonts.whatsYourHeightDesc,
    ),
    UserInfoTitleModel(title: Fonts.letUsKnowYouBetter, desc: ""),
    UserInfoTitleModel(
      title: Fonts.whatsYourDietType,
      desc: Fonts.whatsYourDietTypeDesc,
    ),
    UserInfoTitleModel(
      title: Fonts.doYouTendToEatAroundTheSameTimeEveryDay,
      desc: Fonts.doYouTendToEatAroundTheSameTimeEveryDayDesc,
    ),
    UserInfoTitleModel(
      title: Fonts.thankYouForYourConfidenceInUs,
      desc: Fonts.thankYouForYourConfidenceInUsDesc,
    ),
  ];

  /*
  static List userInfoTitleSection = [
    {"title": Fonts.whatsYourGender, "desc": Fonts.selectYourGender},
    {"title": Fonts.selectYourLanguage, "desc": Fonts.selectYourLanguageDesc},
    {"title": Fonts.weeklyWorkoutCount, "desc": Fonts.weeklyWorkoutCountDesc},
    {
      "title": Fonts.whatAreYourMainGoals,
      "desc": Fonts.whatAreYourMainGoalsDesc,
    },
    {
      "title": Fonts.whatMotivatesYouTheMost,
      "desc": Fonts.whatMotivatesYouTheMostDesc,
    },
    {
      "title": Fonts.howManyPushUpCanYouDo,
      "desc": Fonts.howManyPushUpCanYouDoDesc,
    },
    {
      "title": Fonts.whatsYourActivityLevel,
      "desc": Fonts.whatsYourActivityLevelDesc,
    },
    {"title": Fonts.whatsYourWeight, "desc": Fonts.whatsYourWeightDesc},
    {"title": Fonts.whatsYourHeight, "desc": Fonts.whatsYourHeightDesc},
    {"title": Fonts.letUsKnow, "desc": ""},
    {"title": Fonts.whatsYourDietType, "desc": Fonts.whatsYourDietTypeDesc},
    {
      "title": Fonts.doYouTendToEatAroundTheSameTimeEveryDay,
      "desc": Fonts.doYouTendToEatAroundTheSameTimeEveryDayDesc,
    },
    {
      "title": Fonts.thankYouForYourConfidenceInUs,
      "desc": Fonts.thankYouForYourConfidenceInUsDesc,
    },
  ];
*/

  /*static List weeklyWorkOutOption = [
    {"title": "0-2", "desc": Fonts.workoutNowAndThen},
    {"title": "3-5", "desc": Fonts.someWorkoutsEachWeek},
    {"title": "6+", "desc": Fonts.highLevelAthlete},
  ];
*/

  static List<UserInfoTitleModel> weeklyWorkOutOption = [
    UserInfoTitleModel(title: "0-2", desc: Fonts.workoutNowAndThen),
    UserInfoTitleModel(title: "3-5", desc: Fonts.someWorkoutsEachWeek),
    UserInfoTitleModel(title: "6+", desc: Fonts.highLevelAthlete),
  ];

  /*static List pushUpOption = [
    {"title": Fonts.beginner, "desc": Fonts().optionPushUp("3-5")},
    {"title": Fonts.intermediate, "desc": Fonts().optionPushUp("5-10")},
    {"title": Fonts.advanced, "desc": Fonts.atLeastPusUp},
  ];*/

  static List<UserInfoTitleModel> pushUpModels = [
    UserInfoTitleModel(
      title: Fonts.beginner,
      desc: Fonts().optionPushUp("3-5"),
    ),
    UserInfoTitleModel(
      title: Fonts.intermediate,
      desc: Fonts().optionPushUp("5-10"),
    ),
    UserInfoTitleModel(title: Fonts.advanced, desc: Fonts.atLeastPusUp),
  ];

  /* static List mainGoal = [
    {"title": Fonts.loseWeight, "icon": AppSvg.lw},
    {"title": Fonts.buildMuscle, "icon": AppSvg.bm},
    {"title": Fonts.stayFit, "icon": AppSvg.sf},
  ];*/

  static List<TitleIconModel> mainGoal = [
    TitleIconModel(title: Fonts.loseWeight, icon: AppSvg.lw),
    TitleIconModel(title: Fonts.buildMuscle, icon: AppSvg.bm),
    TitleIconModel(title: Fonts.stayFit, icon: AppSvg.sf),
  ];

  /*static List activityLevel = [
    {
      "title": Fonts.sedentary,
      "icon": AppSvg.sedentary,
      "desc": Fonts.sedentaryDesc,
    },
    {
      "title": Fonts.lightlyActive,
      "icon": AppSvg.lightlyActive,
      "desc": Fonts.lightlyActiveDesc,
    },
    {
      "title": Fonts.moderatelyActive,
      "icon": AppSvg.moderatelyActive,
      "desc": Fonts.moderatelyActiveDesc,
    },
    {
      "title": Fonts.veryActive,
      "icon": AppSvg.veryActive,
      "desc": Fonts.veryActiveDesc,
    },
  ];*/

  static List<ActivityLevelModel> activityLevel = [
    ActivityLevelModel(
      title: Fonts.sedentary,
      icon: AppSvg.sedentary,
      desc: Fonts.sedentaryDesc,
    ),
    ActivityLevelModel(
      title: Fonts.lightlyActive,
      icon: AppSvg.lightlyActive,
      desc: Fonts.lightlyActiveDesc,
    ),
    ActivityLevelModel(
      title: Fonts.moderatelyActive,
      icon: AppSvg.moderatelyActive,
      desc: Fonts.moderatelyActiveDesc,
    ),
    ActivityLevelModel(
      title: Fonts.veryActive,
      icon: AppSvg.veryActive,
      desc: Fonts.veryActiveDesc,
    ),
  ];

  static List<String> weightOption = ['Kg', 'Lb'];
  static List<String> heightOption = ['Ft', 'Cm'];

  /*static List dietType = [
    {
      "title": Fonts.vegetarian,
      "icon": AppSvg.vegetarian,
      "desc": Fonts.vegetarianDesc,
    },
    {
      "title": Fonts.nonVegetarian,
      "icon": AppSvg.nonVegetarian,
      "desc": Fonts.nonVegetarianDesc,
    },
    {
      "title": Fonts.pescatarian,
      "icon": AppSvg.pescatarian,
      "desc": Fonts.pescatarianDesc,
    },
    {
      "title": Fonts.eggetarian,
      "icon": AppSvg.eggetarian,
      "desc": Fonts.eggetarianDesc,
    },
    {"title": Fonts.vegan, "icon": AppSvg.vegan, "desc": Fonts.veganDesc},
  ];*/

  static List<ActivityLevelModel> dietType = [
    ActivityLevelModel(
      title: Fonts.vegetarian,
      icon: AppSvg.vegetarian,
      desc: Fonts.vegetarianDesc,
    ),
    ActivityLevelModel(
      title: Fonts.nonVegetarian,
      icon: AppSvg.nonVegetarian,
      desc: Fonts.nonVegetarianDesc,
    ),
    ActivityLevelModel(
      title: Fonts.pescatarian,
      icon: AppSvg.pescatarian,
      desc: Fonts.pescatarianDesc,
    ),
    ActivityLevelModel(
      title: Fonts.eggetarian,
      icon: AppSvg.eggetarian,
      desc: Fonts.eggetarianDesc,
    ),
    ActivityLevelModel(
      title: Fonts.vegan,
      icon: AppSvg.vegan,
      desc: Fonts.veganDesc,
    ),
  ];

  /*static List eatTime = [
    {"title": Fonts.breakfast, "time": "", "desc": Fonts.breakfastDesc},
    {"title": Fonts.lunch, "time": "", "desc": Fonts.lunchDesc},
    {"title": Fonts.snack, "time": "", "desc": Fonts.snackDesc},
    {"title": Fonts.dinner, "time": "", "desc": Fonts.dinnerDesc},
  ];*/
  static List<EatTimeModel> eatTime = [
    EatTimeModel(title: Fonts.breakfast, time: "", desc: Fonts.breakfastDesc),
    EatTimeModel(title: Fonts.lunch, time: "", desc: Fonts.lunchDesc),
    EatTimeModel(title: Fonts.snack, time: "", desc: Fonts.snackDesc),
    EatTimeModel(title: Fonts.dinner, time: "", desc: Fonts.dinnerDesc),
  ];

  /*  static List motivate = [
    {"title": Fonts.feelConfident, "icon": AppSvg.feelConfident},
    {"title": Fonts.beActive, "icon": AppSvg.beActive},
    {"title": Fonts.boostImmunity, "icon": AppSvg.boostImmunity},
    {"title": Fonts.improveSleep, "icon": AppSvg.improveSleep},
    {"title": Fonts.boostEnergy, "icon": AppSvg.boostEnergy},
  ];*/

  static List<TitleIconModel> motivate = [
    TitleIconModel(title: Fonts.feelConfident, icon: AppSvg.feelConfident),
    TitleIconModel(title: Fonts.beActive, icon: AppSvg.beActive),
    TitleIconModel(title: Fonts.boostImmunity, icon: AppSvg.boostImmunity),
    TitleIconModel(title: Fonts.improveSleep, icon: AppSvg.improveSleep),
    TitleIconModel(title: Fonts.boostEnergy, icon: AppSvg.boostEnergy),
  ];

  /*static List dashboardList = [
    {"title": Fonts.home, "icon": AppSvg.home, "selectedIcon": AppSvg.homeBold},
    {
      "title": Fonts.meals,
      "icon": AppSvg.meals,
      "selectedIcon": AppSvg.mealsBold,
    },
    {
      "title": Fonts.discovery,
      "icon": AppSvg.discover,
      "selectedIcon": AppSvg.discoverBold,
    },
    {
      "title": Fonts.report,
      "icon": AppSvg.report,
      "selectedIcon": AppSvg.reportBold,
    },
    {
      "title": Fonts.settings,
      "icon": AppSvg.setting,
      "selectedIcon": AppSvg.settingBold,
    },
  ];*/

  static List<DashboardBottomModel> dashboardList = [
    DashboardBottomModel(
      title: Fonts.home,
      icon: AppSvg.home,
      selectedIcon: AppSvg.homeBold,
    ),
    DashboardBottomModel(
      title: Fonts.meals,
      icon: AppSvg.meals,
      selectedIcon: AppSvg.mealsBold,
    ),
    DashboardBottomModel(
      title: Fonts.discovery,
      icon: AppSvg.discover,
      selectedIcon: AppSvg.discoverBold,
    ),
    DashboardBottomModel(
      title: Fonts.report,
      icon: AppSvg.report,
      selectedIcon: AppSvg.reportBold,
    ),
    DashboardBottomModel(
      title: Fonts.settings,
      icon: AppSvg.setting,
      selectedIcon: AppSvg.settingBold,
    ),
  ];

  static List<StepData> steps = [
    StepData(
      title: "Unlock Everything",
      highlightText: "Today",
      subtitle: "Easily Track Meals, Scan Calories & Stay on Target!",
    ),
    StepData(
      title: "Your Trial Ends in",
      highlightText: "2 Days",
      subtitle:
          "Don’t worry — we’ll send you a quick reminder so you can decide what’s next!",
    ),
    StepData(
      title: "Enjoy",
      highlightText: "3 Days Free!",
      subtitle:
          "Billing begins on June 22, 2025 unless you cancel before then.",
    ),
  ];

  /*static List settingList =[
    {
      "title":Fonts.general,
      "subMenuList":[
        {
          "title":Fonts.leaveFeedback,
          "desc":Fonts.letUsKnow,
          "icon":AppSvg.feedback
        }
      ]
    },
    {
      "title":Fonts.accountSettings,
      "subMenuList":[
        {
          "title":Fonts.profileInformation,
          "icon":AppSvg.profile
        }, {
          "title":Fonts.generalSettings,
          "icon":AppSvg.profile
        }, {
          "title":Fonts.language,
          "icon":AppSvg.language
        }, {
          "title":Fonts.subscription,
          "icon":AppSvg.subscription
        }, {
          "title":Fonts.dialoguesAndNotifications,
          "icon":AppSvg.bell
        }
      ]
    },
    {
      "title":Fonts.general,
      "subMenuList":[
        {
          "title":Fonts.shareWithFriends,
          "icon":AppSvg.share
        }, {
          "title":Fonts.rateUs,
          "icon":AppSvg.star
        }, {
          "title":Fonts.privacyPolicy,
          "icon":AppSvg.privacy
        }
      ]
    }
  ];*/

  static List<SettingModel> settingList = [
    SettingModel(
      title: Fonts.general,
      subMenuList: [
        SubMenuList(
          title: Fonts.leaveFeedback,
          desc: Fonts.letUsKnow,
          icon: AppSvg.feedback,
        ),
      ],
    ),
    SettingModel(
      title: Fonts.accountSettings,
      subMenuList: [
        SubMenuList(title: Fonts.profileInformation, icon: AppSvg.profile),
        SubMenuList(title: Fonts.generalSettings, icon: AppSvg.profile),
        SubMenuList(title: Fonts.language, icon: AppSvg.language),
        SubMenuList(title: Fonts.subscription, icon: AppSvg.subscription),
        SubMenuList(title: Fonts.dialoguesAndNotifications, icon: AppSvg.bell),
      ],
    ),
    SettingModel(
      title: Fonts.general,
      subMenuList: [
        SubMenuList(title: Fonts.shareWithFriends, icon: AppSvg.share),
        SubMenuList(title: Fonts.rateUs, icon: AppSvg.star),
        SubMenuList(title: Fonts.privacyPolicy, icon: AppSvg.privacy),
      ],
    ),
  ];

 static List<AccountSettingModel> accountSettingList = [
    AccountSettingModel(
      title: Fonts.weightUnit,
      subMenuList: [
        AccountSubMenuList(title: "Kg", isActive: false),
        AccountSubMenuList(title: "Lbs", isActive: false),
      ],
    ),
    AccountSettingModel(
      title: Fonts.heightUnit,
      subMenuList: [
        AccountSubMenuList(title: Fonts.feetUnit, isActive: false),
        AccountSubMenuList(title: Fonts.centimetre, isActive: false),
      ],
    ),
    AccountSettingModel(
      title: Fonts.weeklyCalorieTarget,
      value:3,
    ),
  ];
}
