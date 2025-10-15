import 'dart:developer';

import 'package:calorie_counter/app_config.dart';
import '../../../models/meal_item_model.dart';
import '../../../models/meals_category_model.dart';
import 'meals_controller.dart';
import 'meals_detail_controller.dart';
import 'meals_widget_class.dart';

class MealDetail extends StatefulWidget {
  const MealDetail({super.key});

  @override
  State<MealDetail> createState() => _MealDetailState();
}

class _MealDetailState extends State<MealDetail> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MealsDetailController>(
      init: MealsDetailController(),
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              spacing: 10,
              children: [
                CommonBackCircle(onTap: () => Get.back()),
                Text(
                  ctrl.mealItemModel != null ?ctrl.mealItemModel?.title?? "":"",
                  style: AppCss.soraMedium16,
                ),
              ],
            ),
          ),

          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ListView.builder(
                  itemCount: ctrl.mealItemModel?.meals!.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    return MealsWidgetClass.buildMealCard(ctrl.mealItemModel!.meals![i], () => favTap(ctrl,i));
                  },
                ),
              ],
            ).paddingAll(16),
          ),
        );
      },
    );
  }


  void favTap(MealsDetailController ctrl, index) {
    ctrl.favTap(index);
  }
}
