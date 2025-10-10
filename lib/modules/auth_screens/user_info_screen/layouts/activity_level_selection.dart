import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:calorie_counter/models/acitivity_level_model.dart';

import '../../../../app_config.dart';

class ActivityLevelSelection extends StatelessWidget {
  final String? option;
  final Function(ActivityLevelModel) onTap;

  const ActivityLevelSelection({super.key, this.option, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 19,
      children: [
       ListView.builder(
         itemCount: AppArray.activityLevel.length,
         shrinkWrap: true,
         itemBuilder: (context, index) {
           ActivityLevelModel data = AppArray.activityLevel[index];
         return Container(
           padding: EdgeInsets.all(16),
           margin: EdgeInsets.only(bottom: 10),
           decoration: BoxDecoration(
             color: AppColors.white,
             borderRadius: BorderRadius.circular(12),
             border: Border.all(
               color: option == data.title
                   ? AppColors.primaryColor
                   : AppColors.white,
             ),
           ),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Expanded(
                 child: Row(
                   children: [
                     if (option == data.title)
                       SvgPicture.asset(AppSvg.check).paddingOnly(right: 10),
                     Expanded(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             data.title.toString().tr,
                             style: AppCss.soraMedium16.copyWith(
                               color: option == data.title
                                   ? AppColors.primaryColor
                                   : AppColors.black,
                             ),
                           ),
                           VSpace(4),
                           Text(
                             data.desc.toString().tr,
                             style: AppCss.soraRegular12,
                           ),
                         ],
                       ),
                     ),
                   ],
                 ),
               ),
               SvgPicture.asset(data.icon!),
             ],
           ),
         ).inkWell(onTap: () => onTap(data));
       },)
      ],
    ).paddingOnly(top: 32);
  }
}
