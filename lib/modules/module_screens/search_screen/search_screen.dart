import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:calorie_counter/modules/module_screens/search_screen/layouts/search_option.dart';
import 'package:calorie_counter/modules/module_screens/search_screen/search_screen_controller.dart';
import 'package:calorie_counter/widgets/common_empty_layout.dart';
import 'package:calorie_counter/widgets/common_image_layout.dart';

import '../../main_screens/meals/meals_widget_class.dart';
import 'layouts/all_search_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchScreenController>(
      init: SearchScreenController(),
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              spacing: 10,
              children: [
                CommonBackCircle(onTap: () => Get.back()),
                Text(Fonts.search.tr, style: AppCss.soraMedium16),
              ],
            ),

            actions: [
              CommonClass.commonCircleIcon(AppSvg.filter),

              HSpace(4),
              CommonClass.commonCircleIcon(AppSvg.scan),
              HSpace(16),
            ],
          ),
          bottomNavigationBar: appButton(
            Fonts.addFood.tr,
          ).padding(horizontal: 16, bottom: 30),
          body: Stack(
            children: [
              ListView(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                children: [
                  AppTextField(
                    color: AppColors.white,
                    onChanged: (v) => ctrl.searchFood(v),
                    bColor: Colors.transparent,
                    controller: ctrl.search,
                    bRadius: 12,
                    hintText: Fonts.searchFood.tr,
                    hintStyle: AppCss.soraRegular14.copyWith(
                      color: AppColors.gary,
                    ),
                    prefixIcon: SvgPicture.asset(
                      AppSvg.search1,
                    ).paddingSymmetric(horizontal: 14),
                  ),
                  VSpace(12),
                  SearchOption(
                    onTap: (val) => optionSelect(ctrl, val),
                    selectedOption: ctrl.selectedOption,
                  ),
                  VSpace(12),
                  if (ctrl.search.text.isNotEmpty && ctrl.searchList.isNotEmpty && ctrl.selectedOption ==null)
                    AllSearchList(list: ctrl.searchList,),
                  if (ctrl.search.text.isNotEmpty && ctrl.searchList.isEmpty && ctrl.selectedOption != null)
                    IndexedStack(
                      index: ctrl.selectedOption == Fonts.favourites
                          ? 0
                          : ctrl.selectedOption == Fonts.myFood
                          ? 1
                          : 2,
                      children: [
                        ListView.builder(
                          itemCount: ctrl.favSearch!.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, i) {
                            return MealsWidgetClass.buildMealCard(ctrl.favSearch![i],() {

                            },);
                          },
                        ),

                        AllSearchList(list: ctrl.myFood,isAction: true,),
                        Container()
                      ],
                    )

                ],
              ),
              if (ctrl.search.text.isNotEmpty && ctrl.searchList.isEmpty && ctrl.selectedOption ==null)
                CommonEmptyLayout(title: Fonts.noResultsFound, desc: Fonts.noResultsFoundDesc),

              if (ctrl.search.text.isNotEmpty && ctrl.searchList.isEmpty && ctrl.selectedOption == Fonts.favourites)
                CommonEmptyLayout(title: Fonts.yourFavouritesListIsEmpty, desc: Fonts.startBuildingYourCollectionNow),
            ],
          ),
        );
      },
    );
  }

  void optionSelect(SearchScreenController ctrl, val) {
    ctrl.optionTap(val);
  }
}
