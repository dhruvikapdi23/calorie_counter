import 'package:calorie_counter/extension/widget_extension.dart';

import '../../../../app_config.dart';
import '../../../../models/food_item.dart';

class AllSearchList extends StatefulWidget {
  final List<FoodItem> list;
  final bool isAction;
  final bool isGram;

  const AllSearchList({super.key, required this.list, this.isAction = false,  this.isGram=true});

  @override
  State<AllSearchList> createState() => _AllSearchListState();
}

class _AllSearchListState extends State<AllSearchList> {
  int? expandedIndex; // 👈 Track which row’s menu is open

  void _toggleMenu(int index) {
    setState(() {
      expandedIndex = expandedIndex == index ? null : index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,

      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.list.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final foodItem = widget.list[index];
        final isExpanded = expandedIndex == index;
        return Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: .05),
                offset: Offset(0, 10),
                blurRadius: 20,
              ),
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 12,
                children: [
                  CommonImageLayout(
                    height: 39,
                    width: 39,
                    borderRadius: 6,
                    assetImage: foodItem.image,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(foodItem.name, style: AppCss.soraRegular13),
                      VSpace(6),
                      Row(
                        spacing: 14,
                        children: [
                          if(widget.isGram)
                          Row(
                            spacing: 4,
                            children: [
                              Container(
                                height: 4,
                                width: 4,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.gary,
                                ),
                              ),
                              Text(
                                foodItem.weight,
                                style: AppCss.soraRegular12.copyWith(
                                  color: AppColors.gary,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 4,
                            children: [
                              if(widget.isGram)
                              Container(
                                height: 4,
                                width: 4,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.gary,
                                ),
                              ),
                              Text(
                                foodItem.calories,
                                style: AppCss.soraRegular12.copyWith(
                                  color: AppColors.gary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              if (widget.isAction && !isExpanded)
                GestureDetector(
                  onTap: () => _toggleMenu(index),
                  child: SvgPicture.asset(AppSvg.more,colorFilter:!widget.isGram? ColorFilter.mode(AppColors.black, BlendMode.srcIn):null),
                ),
              if(isExpanded)
                Row(spacing: 16,
                  children: [
                    SvgPicture.asset(AppSvg.edit),
                    SvgPicture.asset(AppSvg.copy),
                    SvgPicture.asset(AppSvg.trash),
                  ],
                ),

            ],
          ),
        ).inkWell(onTap: ()=>onTap(foodItem));
      },
    );
  }
  
  
  onTap(val){
    Get.toNamed(RouteName.foodDetail,arguments: val);
  }
}
