import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:calorie_counter/models/title_icon_model.dart';

import '../../../../app_config.dart';

class MainGoalSelection extends StatelessWidget {
  final String? option;
  final Function(TitleIconModel) onTap;

  const MainGoalSelection({
    super.key,
     this.option,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 19,
      children: [
       ListView.builder(
         itemCount:  AppArray.mainGoal.length,
         shrinkWrap: true,
         itemBuilder: (context, index) {
           TitleIconModel data = AppArray.mainGoal[index];
         return Container(
           padding: EdgeInsets.all(16),
           margin: EdgeInsets.only(bottom: 10),
           decoration: BoxDecoration(
             color: AppColors.white,
             borderRadius: BorderRadius.circular(12),
             border: Border.all(color: option == data.title ? AppColors.primaryColor:AppColors.white),
           ),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Row(
                 children: [
                   if (option == data.title)
                     SvgPicture.asset(AppSvg.check).paddingOnly(right: 10),
                   Text(data.title.toString().tr,style:AppCss.soraMedium16.copyWith(color: option == data.title? AppColors.primaryColor:AppColors.black) )
                 ],
               ),
               SvgPicture.asset(data.icon!)
             ],
           ),
         ).inkWell(onTap: () => onTap(data));
       },)
      ],
    ).paddingOnly(top: 32);
  }
}
