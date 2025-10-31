import 'package:calorie_counter/languages/language_translate.dart';
import 'package:calorie_counter/modules/auth_screens/plan/plan.dart';
import 'package:calorie_counter/modules/main_screens/dashboard/dashboard.dart';
import 'package:calorie_counter/modules/main_screens/meals/meals_detail.dart';
import 'package:calorie_counter/modules/module_screens/add_food/add_food.dart';
import 'package:calorie_counter/modules/module_screens/discover_detail/discover_detail.dart';
import 'package:calorie_counter/modules/module_screens/filter/filter.dart';
import 'package:calorie_counter/modules/module_screens/food_detail/food_detail.dart';
import 'package:calorie_counter/modules/module_screens/general_infomation/general_information.dart';
import 'package:calorie_counter/modules/module_screens/language_screen/langugae_screen.dart';
import 'package:calorie_counter/modules/module_screens/search_screen/search_screen.dart';

import '../app_config.dart';
import '../app_config.dart';
import '../modules/auth_screens/intro_screen/intro_screen.dart';
import '../modules/auth_screens/user_info_screen/user_info_screen.dart';
import '../modules/module_screens/profile_information/profile_information.dart';
import '../modules/module_screens/scan_image/scan_image.dart';

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(
      name: RouteName.introScreen,
      page: () => const IntroScreen(),
      transition: Transition.noTransition, // disables animations
    ),
    GetPage(
      name: RouteName.userInfo,
      page: () => const UserInfoScreen(),
      transition: Transition.noTransition, // disables animations
    ),
    GetPage(
      name: RouteName.plan,
      page: () => const Plan(),
      transition: Transition.noTransition, // disables animations
    ),
    GetPage(
      name: RouteName.dashboard,
      page: () => const Dashboard(),
      transition: Transition.noTransition, // disables animations
    ),
    GetPage(
      name: RouteName.profileInformation,
      page: () => const ProfileInformation(),
      transition: Transition.noTransition, // disables animations
    ),
    GetPage(
      name: RouteName.generalInformation,
      page: () => const GeneralInformation(),
      transition: Transition.noTransition, // disables animations
    ),
    GetPage(
      name: RouteName.language,
      page: () => const LanguageScreen(),
      transition: Transition.noTransition, // disables animations
    ),
    GetPage(
      name: RouteName.mealDetail,
      page: () => const MealDetail(),
      transition: Transition.noTransition, // disables animations
    ),
    GetPage(
      name: RouteName.search,
      page: () => const SearchScreen(),
      transition: Transition.noTransition, // disables animations
    ),
    GetPage(
      name: RouteName.foodDetail,
      page: () => const FoodDetail(),
      transition: Transition.noTransition, // disables animations
    ),
    GetPage(
      name: RouteName.filter,
      page: () => const Filter(),
      transition: Transition.noTransition, // disables animations
    ),
    GetPage(
      name: RouteName.addFood,
      page: () => const AddFood(),
      transition: Transition.noTransition, // disables animations
    ),
    GetPage(
      name: RouteName.scanImage,
      page: () => const ScanImage(),
      transition: Transition.noTransition, // disables animations
    ),
    GetPage(
      name: RouteName.discoverDetail,
      page: () => const DiscoverDetail(),
      transition: Transition.noTransition, // disables animations
    ),
  ];
}
