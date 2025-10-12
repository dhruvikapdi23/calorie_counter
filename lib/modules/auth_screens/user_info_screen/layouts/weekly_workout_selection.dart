import 'package:calorie_counter/extension/widget_extension.dart';

import '../../../../app_config.dart';
import '../../../../models/user_info_title_model.dart';

class WeeklyWorkOutSelection extends StatelessWidget {
  final String? option;
  final Function(UserInfoTitleModel) onTap;

  const WeeklyWorkOutSelection({
    super.key,
     this.option,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

   /* // Convert to typed model list
    final List<UserInfoTitleModel> userInfoTitleModels = AppArray.userInfoTitleSection
        .map((json) => UserInfoTitleModel.fromJson(json))
        .toList();*/

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 19,
      children: [

      ListView.builder(
        itemCount: AppArray.weeklyWorkOutOption.length,
        shrinkWrap:  true,
        itemBuilder: (context, index) {
          UserInfoTitleModel data = AppArray.weeklyWorkOutOption[index];
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
              Flexible(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(data.title.toString().tr,style:AppCss.soraMedium16.copyWith(color: option == data.title? AppColors.primaryColor:AppColors.black) ),
                    VSpace(4),
                    Text(data.desc.toString().tr,style:AppCss.soraRegular14 )
                  ],
                ),
              ),
              if (option == data.title)
                SvgPicture.asset(AppSvg.check).paddingOnly(right: 10),
            ],
          ),
        ).inkWell(onTap: () => onTap(data));
      },)
      ],
    ).paddingOnly(top: 32);
  }
}
