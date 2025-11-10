import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:calorie_counter/models/user_info_title_model.dart';

import '../../../../app_config.dart';

class PushUpSelection extends StatelessWidget {
  final String? option;
  final Function(UserInfoTitleModel) onTap;
final int index;
  const PushUpSelection({
    super.key,
     this.option,
    required this.onTap, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonUserTitleDesc(index: index!),

        ListView.builder(
        itemCount: AppArray.pushUpModels.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          UserInfoTitleModel data = AppArray.pushUpModels[index];
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
              Text(data.desc.toString().tr,style:AppCss.soraRegular12)
            ],
          ),
        ).inkWell(onTap: () => onTap(data));
      },)
      ],
    );
  }
}
