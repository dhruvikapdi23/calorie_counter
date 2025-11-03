

import 'package:calorie_counter/models/meals_category_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app_config.dart';

class ReportController extends GetxController {
  int currentStep = 0; // example: currently at step 4 of 14
  MealCategoryModel? selectedCategory;
  XFile? image;

  String selectedChartMonth = "All";

  nextTo(val) {
    currentStep = val;
    update();
  }

  pickImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    image = await picker.pickImage(source: ImageSource.gallery);
    update();
  }


  categorySelect(val) {
    selectedCategory = val;
    update();
  }
  monthTap(val) {
    selectedChartMonth = val;
    update();
  }
}
