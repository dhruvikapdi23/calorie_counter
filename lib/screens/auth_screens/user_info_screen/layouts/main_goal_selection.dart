import 'package:calorie_counter/extension/widget_extension.dart';

import '../../../../app_config.dart';

class MainGoalSelection extends StatelessWidget {
  final String? option;
  final Function(dynamic) onTap;

  const MainGoalSelection({
    super.key,
     this.option,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 19,
        children: [
          ...AppArray.mainGoal.asMap().entries.map(
            (e) => Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: option == e.value['title'] ? AppColors.primaryColor:AppColors.white),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (option == e.value['title'])
                        SvgPicture.asset(AppSvg.check).paddingOnly(right: 10),
                      Text(e.value['title'].toString().tr,style:AppCss.soraMedium16.copyWith(color: option == e.value['title']? AppColors.primaryColor:AppColors.black) )
                    ],
                  ),
                  SvgPicture.asset(e.value['icon'])
                ],
              ),
            ).inkWell(onTap: () => onTap(e.value)),
          ),
        ],
      ).paddingOnly(top: 32),
    );
  }
}
