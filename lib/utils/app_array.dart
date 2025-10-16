import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/models/meal_item_model.dart';
import 'package:calorie_counter/models/meal_item_model.dart';
import 'package:calorie_counter/models/meal_item_model.dart';
import 'package:calorie_counter/models/meal_item_model.dart';
import 'package:calorie_counter/models/meals_category_model.dart';
import 'package:calorie_counter/models/meals_category_model.dart';
import 'package:calorie_counter/models/meals_category_model.dart';
import 'package:calorie_counter/models/meals_category_model.dart';
import 'package:calorie_counter/models/meals_category_model.dart';
import 'package:calorie_counter/models/meals_category_model.dart';
import 'package:calorie_counter/modules/main_screens/meals/meals.dart';

import '../models/account_setting_model.dart';
import '../models/acitivity_level_model.dart';
import '../models/dashboard_bottom_model.dart';
import '../models/eat_time_model.dart';
import '../models/food_item.dart';
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
    AccountSettingModel(title: Fonts.weeklyCalorieTarget, value: 3),
  ];

  static List<MealCategoryModel> categories = [
    MealCategoryModel(name: "Suggested", icon: AppSvg.suggested),
    MealCategoryModel(name: "Keto", icon: AppSvg.keto),
    MealCategoryModel(name: "Vegetarian", icon: AppSvg.vegetarian1),
    MealCategoryModel(name: "Fruits", icon: AppSvg.fruits),
    MealCategoryModel(name: "Protein", icon: AppSvg.protein),
  ];

  static List<MealItemModel> mealSections = [
    MealItemModel(
      title: "Breakfast Selection",
      meals: [
        MealsModel(
          image: AppImages.bs1,
          title: "Avocado Toast With Scrambled Eggs",
          kcal: 190,
          carbs: 160,
          fat: 18,
          protein: 25,
          isFavourite: false,
        ),
        MealsModel(
          image: AppImages.bs2,
          title: "Smashed Avocado On Whole Grain Toast",
          kcal: 200,
          carbs: 170,
          fat: 20,
          protein: 30,
          isFavourite: false,
        ),
        MealsModel(
          image: AppImages.bs2,
          title: "Smashed Avocado On Whole Grain Toast",
          kcal: 200,
          carbs: 170,
          fat: 20,
          protein: 30,
          isFavourite: false,
        ),

        MealsModel(
          title: "Quinoa Salad With Roasted Vegetables",
          image: AppImages.bs3,
          kcal: 350,
          carbs: 45,
          fat: 15,
          protein: 12,
          isFavourite: false,
        ),
        MealsModel(
          title: "Chicken Wrap With Hummus And Greens",
          image: AppImages.bs4,
          kcal: 400,
          carbs: 50,
          fat: 18,
          protein: 25,
          isFavourite: false,
        ),
        MealsModel(
          title: "Vegetable Stir-Fry With Tofu And Brown Rice",
          image: AppImages.bs5,
          kcal: 450,
          carbs: 60,
          fat: 12,
          protein: 20,
          isFavourite: false,
        ),
        MealsModel(
          title: "Greek Yogurt Parfait With Berries And Granola",
          image: AppImages.bs6,
          kcal: 300,
          carbs: 35,
          fat: 10,
          protein: 15,
          isFavourite: false,
        ),
        MealsModel(
          title: "Spicy Chickpea Curry With Coconut Rice",
          image: AppImages.bs7,
          kcal: 500,
          carbs: 70,
          fat: 22,
          protein: 18,
          isFavourite: false,
        ),
      ],
    ),
    MealItemModel(
      title: "Lunch Selection",
      meals: [
        MealsModel(
          image: AppImages.ls1,
          title: "Quinoa Salad With Chickpeas",
          kcal: 220,
          carbs: 30,
          fat: 8,

          protein: 10,
          isFavourite: false,
        ),
        MealsModel(
          image: AppImages.ls2,
          title: "Grilled Chicken Breast With Broccoli",
          kcal: 250,
          carbs: 15,
          fat: 5,
          protein: 50,
          isFavourite: false,
        ),

        MealsModel(
          image: AppImages.ls3,
          title: "Grilled Chicken Salad With Quinoa",
          kcal: 350,
          carbs: 30,
          fat: 15,
          protein: 40,
          isFavourite: false,
        ),
        MealsModel(
          image: AppImages.ls4,
          title: "Pasta Primavera With Olive Oil",
          kcal: 450,
          carbs: 60,
          fat: 18,
          protein: 12,
          isFavourite: false,
        ),
        MealsModel(
          image: AppImages.ls5,
          title: "Chickpea And Spinach Curry",
          kcal: 400,
          carbs: 50,
          fat: 10,
          protein: 15,
          isFavourite: false,
        ),
        MealsModel(
          image: AppImages.ls6,
          title: "Shrimp Tacos With Cabbage Slaw",
          kcal: 320,
          carbs: 40,
          fat: 12,
          protein: 25,
          isFavourite: false,
        ),
        MealsModel(
          image: AppImages.ls7,
          title: "Vegetable Stir-Fry With Tofu",
          kcal: 380,
          carbs: 45,
          fat: 14,
          protein: 18,
          isFavourite: false,
        ),
        MealsModel(
          image: AppImages.ls8,
          title: "Beef And Broccoli With Garlic",
          kcal: 500,
          carbs: 55,
          fat: 20,
          protein: 35,
          isFavourite: false,
        ),
      ],
    ),
    MealItemModel(
      title: "Dinner Selection",
      meals: [
        MealsModel(
          image: AppImages.ds1,
          title: "Greek Yogurt With Honey And Berries",
          kcal: 180,
          carbs: 22,
          fat: 3,
          protein: 15,
          isFavourite: false,
        ),
        MealsModel(
          image: AppImages.ds2,
          title: "Oatmeal With Almonds And Banana",
          kcal: 300,
          carbs: 45,
          fat: 10,
          protein: 8,
          isFavourite: false,
        ),
        MealsModel(
          image: AppImages.ds3,
          title: "Baked Salmon With Spinach",
          kcal: 420,
          carbs: 40,
          fat: 18,
          protein: 35,
          isFavourite: false,
        ),
        MealsModel(
          image: AppImages.ds4,
          title: "Turkey And Hummus Wrap",
          kcal: 300,
          carbs: 28,
          fat: 12,
          protein: 32,
          isFavourite: false,
        ),
        MealsModel(
          image: AppImages.ds5,
          title: "Vegetable Stir-Fry With Tofu",
          kcal: 380,
          carbs: 50,
          fat: 10,
          protein: 25,
          isFavourite: false,
        ),
        MealsModel(
          image: AppImages.ds6,
          title: "Lentil Soup With Whole Grain Bread",
          kcal: 290,
          carbs: 45,
          fat: 8,
          protein: 18,
          isFavourite: false,
        ),
        MealsModel(
          image: AppImages.ds7,
          title: "Shrimp Tacos With Cabbage Slaw",
          kcal: 450,
          carbs: 35,
          fat: 22,
          protein: 30,
          isFavourite: false,
        ),
        MealsModel(
          image: AppImages.ds8,
          title: "Chickpea Salad With Feta",
          kcal: 320,
          carbs: 40,
          fat: 10,
          protein: 20,
          isFavourite: false,
        ),
      ],
    ),
  ];

  static List searchOption = [
    {"title": Fonts.favourites, "icon": AppSvg.heart},
    {"title": Fonts.myFood, "icon": AppSvg.spoon},
    {"title": Fonts.plates, "icon": AppSvg.spoon},
  ];

  static List<FoodItem> foodItems = [
    FoodItem(
      name: 'Green Goodness Sandwich',
      weight: '200 g',
      calories: '350 kcal',
      image: AppImages.bs1,
    ), FoodItem(
      name: 'Green Sandwich',
      weight: '200 g',
      calories: '350 kcal',
      image: AppImages.bs1,
    ),
    FoodItem(
      name: 'Avocado Delight Toastie',
      weight: '100 g',
      calories: '200 kcal',
      image: AppImages.bs3,
    ),
    FoodItem(
      name: 'Crispy Avo Crunch',
      weight: '150 g',
      calories: '300 kcal',
      image: AppImages.bs2,
    ),
    FoodItem(
      name: 'Creamy Avocado Bite',
      weight: '100 g',
      calories: '220 kcal',
      image: AppImages.bs5,
    ),
  ];



  static List<MealsModel> favList = [
    MealsModel(
      image: AppImages.ls1,
      title: "Quinoa Salad With Chickpeas",
      kcal: 220,
      carbs: 30,
      fat: 8,

      protein: 10,
      isFavourite: true,
    ),
    MealsModel(
      image: AppImages.ls2,
      title: "Grilled Chicken Breast With Broccoli",
      kcal: 250,
      carbs: 15,
      fat: 5,
      protein: 50,
      isFavourite: true,
    ),

    MealsModel(
      image: AppImages.ls3,
      title: "Grilled Chicken Salad With Quinoa",
      kcal: 350,
      carbs: 30,
      fat: 15,
      protein: 40,
      isFavourite: true,
    ),
  ];
}
