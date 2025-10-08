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

  static List pushUpOption = [
    {"title": Fonts.beginner, "desc": Fonts().optionPushUp("3-5")},
    {"title": Fonts.intermediate, "desc":  Fonts().optionPushUp("5-10")},
    {"title": Fonts.advanced, "desc":  Fonts.atLeastPusUp},
  ];

  static List mainGoal = [
    {"title": Fonts.loseWeight, "icon": AppSvg.lw},
    {"title": Fonts.buildMuscle, "icon": AppSvg.bm},
    {"title": Fonts.stayFit, "icon": AppSvg.sf},

  ];


  static List activityLevel = [
    {"title": Fonts.sedentary, "icon": AppSvg.sedentary,"desc":Fonts.sedentaryDesc},
    {"title": Fonts.lightlyActive, "icon": AppSvg.lightlyActive,"desc":Fonts.lightlyActiveDesc},
    {"title": Fonts.moderatelyActive, "icon": AppSvg.moderatelyActive,"desc":Fonts.moderatelyActiveDesc},
    {"title": Fonts.veryActive, "icon": AppSvg.veryActive,"desc":Fonts.veryActiveDesc},

  ];


  static List dietType = [
    {"title": Fonts.vegetarian, "icon": AppSvg.vegetarian,"desc":Fonts.vegetarianDesc},
    {"title": Fonts.nonVegetarian, "icon": AppSvg.nonVegetarian,"desc":Fonts.nonVegetarianDesc},
    {"title": Fonts.pescatarian, "icon": AppSvg.pescatarian,"desc":Fonts.pescatarianDesc},
    {"title": Fonts.eggetarian, "icon": AppSvg.eggetarian,"desc":Fonts.eggetarianDesc},
    {"title": Fonts.vegan, "icon": AppSvg.vegan,"desc":Fonts.veganDesc},

  ];



  static List eatTime = [
    {"title": Fonts.breakfast, "time": "","desc":Fonts.breakfastDesc},
    {"title": Fonts.lunch, "time": "","desc":Fonts.lunchDesc},
    {"title": Fonts.snack, "time": "","desc":Fonts.snackDesc},
    {"title": Fonts.dinner, "time": "","desc":Fonts.dinnerDesc},

  ];

  static List motivate = [
    {"title": Fonts.feelConfident, "icon": AppSvg.feelConfident},
    {"title": Fonts.beActive, "icon": AppSvg.beActive},
    {"title": Fonts.boostImmunity, "icon": AppSvg.boostImmunity},
    {"title": Fonts.improveSleep, "icon": AppSvg.improveSleep},
    {"title": Fonts.boostEnergy, "icon": AppSvg.boostEnergy},

  ];
}
