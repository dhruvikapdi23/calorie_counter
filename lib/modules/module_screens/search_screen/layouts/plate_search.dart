import 'package:calorie_counter/extension/widget_extension.dart';

import '../../../../app_config.dart';
import '../../../../models/food_item.dart';

class PlateSearchList extends StatefulWidget {
  final List<FoodItem> list;
  final bool isAction, isPlates;
  final String selectedPlate;
  final Function(String) onTap;

  const PlateSearchList({
    super.key,
    required this.list,
    this.isAction = false,
    this.isPlates = false,
    required this.selectedPlate,
    required this.onTap,
  });

  @override
  State<PlateSearchList> createState() => _PlateSearchListState();
}

class _PlateSearchListState extends State<PlateSearchList> {
  int? expandedIndex; // 👈 Track which row’s menu is open

  void _toggleMenu(int index) {
    setState(() {
      expandedIndex = expandedIndex == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 10,
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: AppArray.platesOption
              .asMap()
              .entries
              .map(
                (e) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: widget.selectedPlate == e.value
                        ? AppColors.black
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: widget.selectedPlate == e.value
                          ? AppColors.black
                          : AppColors.lightGrey,
                    ),
                  ),
                  child: AppText(
                    e.value.tr,
                    style: AppCss.soraRegular12.copyWith(
                      color: widget.selectedPlate == e.value
                          ? AppColors.white
                          : AppColors.gary,
                    ),
                  ),
                ).inkWell(onTap: () => selectPlateOption(e.value)),
              )
              .toList(),
        ),
        VSpace(12),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            final foodItem = widget.list[index];
            final isExpanded = expandedIndex == index;
            return CommonFoodListLayout(
              image: foodItem.image,
              name: foodItem.name,
              weight: foodItem.weight,calories: foodItem.calories,
              actionWidget: Row(
                children: [
                  if (widget.isAction && !isExpanded)
                    GestureDetector(
                      onTap: () => _toggleMenu(index),
                      child: SvgPicture.asset(AppSvg.more),
                    ),
                  if (isExpanded)
                    Row(
                      spacing: 16,
                      children: [
                        SvgPicture.asset(AppSvg.edit),
                        SvgPicture.asset(AppSvg.copy),
                        SvgPicture.asset(AppSvg.trash),
                      ],
                    ),
                  if (widget.isPlates)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey.withValues(alpha: .20),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        spacing: 5,
                        children: [
                          AppText(foodItem.userCount, style: AppCss.soraRegular14),
                          Image.asset(AppImages.user, height: 15, width: 15),
                        ],
                      ),
                    ),
                ],
              ),
            ).inkWell(onTap: () => onTap(foodItem));
          },
        ),
      ],
    );
  }

  void selectPlateOption(val) {
    widget.onTap(val);
  }

  void onTap(val) {
    Navigation.toNamed(RouteName.foodDetail, arguments: val);
  }
}
