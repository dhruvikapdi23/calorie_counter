import 'package:calorie_counter/app_config.dart';

class AppArray {
  static List languageList = [
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
  ];

  static List genderList = [
    {"title": "Male", "image": AppImages.boy},
    {"title": "Female", "image": AppImages.girl},
  ];

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
    {"title": Fonts.whatsYourWeight, "desc": Fonts.whatsYourWeightDesc},
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

  static List weeklyWorkOutOption = [
    {"title": "0-2", "desc": Fonts.workoutNowAndThen},
    {"title": "3-5", "desc": Fonts.someWorkoutsEachWeek},
    {"title": "6+", "desc": Fonts.highLevelAthlete},
  ];

  static List mainGoal = [
    {"title": Fonts.loseWeight, "icon": AppSvg.lw},
    {"title": Fonts.buildMuscle, "icon": AppSvg.bm},
    {"title": Fonts.stayFit, "icon": AppSvg.sf},

  ];
}
