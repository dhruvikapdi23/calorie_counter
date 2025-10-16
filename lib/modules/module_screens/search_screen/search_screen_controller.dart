import 'dart:developer';

import 'package:calorie_counter/models/food_item.dart';
import 'package:calorie_counter/utils/app_session_key.dart';

import '../../../app_config.dart';
import '../../../models/meal_item_model.dart';

class SearchScreenController extends GetxController {
  TextEditingController search = TextEditingController();
  List<FoodItem> searchList = [];
  List<FoodItem> myFood = [];
  List<MealsModel> favSearch = [];
  String? selectedOption;

  optionTap(val) {
    selectedOption = val;
    searchFood(search.text);
    update();
  }

  searchFood(name) {
    if (name.toString().isEmpty) {
      searchList = [];
      favSearch = [];
      search.text = "";
      update();
    }

    if (name.toString().length > 3) {
      if (selectedOption == Fonts.favourites) {
        favSearch = AppArray.favList.where((element) {
          if (name == null || name.isEmpty) return true;
          return element.title!.toLowerCase().contains(name.toLowerCase());
        }).toList();
      } else if (selectedOption == Fonts.myFood) {
        myFood = AppArray.foodItems.where((element) {
          if (name == null || name.isEmpty) return true;
          return element.name.toLowerCase().contains(name.toLowerCase());
        }).toList();
      } else {
        searchList = AppArray.foodItems.where((element) {
          if (name == null || name.isEmpty) return true;
          return element.name.toLowerCase().contains(name.toLowerCase());
        }).toList();
      }
      log("searchList :${searchList.length}");
      log("myFood :${myFood.length}");
      log("favSearch :${favSearch.length}");
      update();
    }
  }
}
