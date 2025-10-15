import 'package:calorie_counter/languages/language_translate.dart';
import 'package:calorie_counter/modules/auth_screens/plan/plan.dart';
import 'package:calorie_counter/modules/main_screens/dashboard/dashboard.dart';
import 'package:calorie_counter/modules/main_screens/meals/meals_detail.dart';
import 'package:calorie_counter/modules/module_screens/general_infomation/general_information.dart';
import 'package:calorie_counter/modules/module_screens/language_screen/langugae_screen.dart';
import 'package:calorie_counter/modules/module_screens/search_screen/search_screen.dart';

import '../app_config.dart';
import '../app_config.dart';
import '../modules/auth_screens/intro_screen/intro_screen.dart';
import '../modules/auth_screens/user_info_screen/user_info_screen.dart';
import '../modules/module_screens/profile_information/profile_information.dart';

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
    ),  GetPage(
      name: RouteName.mealDetail,
      page: () => const MealDetail(),
      transition: Transition.noTransition, // disables animations
    ), GetPage(
      name: RouteName.search,
      page: () => const SearchScreen(),
      transition: Transition.noTransition, // disables animations
    ),

    /*  GetPage(name: _routeName.bibleVersion, page: () => const BibleVersionScreen()),
    GetPage(name: _routeName.dashboard, page: () => const DashboardScreen()),
    GetPage(name: _routeName.testamentChapter, page: () => const ChapterList()),
    GetPage(name: _routeName.highlight, page: () => const HighLightListScreen()),
    GetPage(name: _routeName.chapter, page: () => const ChapterDescriptionScreen()),
    GetPage(name: _routeName.webView, page: () => const WebView()),
    GetPage(name: _routeName.signIn, page: () => const SignInScreen()),
    GetPage(name: _routeName.forgotPassword, page: () => const ForgotPasswordScreen()),
    GetPage(name: _routeName.signUp, page: () => const SignUpScreen()),
    GetPage(name: _routeName.changePassword, page: () => const ChangePasswordScreen()),
    GetPage(name: _routeName.otp, page: () => const OtpScreen()),
    GetPage(name: _routeName.chat, page: () =>  ChatScreen()),
    GetPage(name: _routeName.groupInfo, page: () => const GroupInfoScreen()),
    GetPage(name: _routeName.editProfile, page: () => const EditProfileScreen()),
    GetPage(name: _routeName.offlineChapter, page: () => const OfflineChapterScreen()),*/
  ];
}
