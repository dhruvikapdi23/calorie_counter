import 'package:calorie_counter/modules/main_screens/discover/discover.dart';
import 'package:calorie_counter/modules/main_screens/home/home.dart';
import 'package:calorie_counter/modules/main_screens/meals/meals.dart';
import 'package:calorie_counter/modules/main_screens/report/report.dart';
import 'package:calorie_counter/modules/main_screens/setting/setting.dart';

import '../../../app_config.dart';

class DashboardController extends GetxController {
  int currentStep = 0; // example: currently at step 4 of 14


  List<Widget> get pages => [
    Home(),
    Meals(),
    Discover(),
    Report(),
    Setting()
  ];

  nextTo(val) {
    currentStep = val;
    update();
  }


}
