import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_config.dart';
import '../../../../models/user_info_title_model.dart';
import '../../../../widgets/common_user_title_desc.dart';

class WeeklyWorkOutSelection extends StatelessWidget {
  final String? option;
  final Function(UserInfoTitleModel) onTap;

  final int index;
  const WeeklyWorkOutSelection({super.key, this.option, required this.onTap, required this.index});

  @override
  Widget build(BuildContext context) {
    /* // Convert to typed model list
    final List<UserInfoTitleModel> userInfoTitleModels = AppArray.userInfoTitleSection
        .map((json) => UserInfoTitleModel.fromJson(json))
        .toList();*/

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonUserTitleDesc(index: index),

        ListView.builder(
          itemCount: AppArray.weeklyWorkOutOption.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            UserInfoTitleModel data = AppArray.weeklyWorkOutOption[index];
            return InkWell(
              onTap: () => onTap(data),
              child: CommonClass.commonContainerClass(
                padding: EdgeInsets.all(SizeUtils.fSize_16()),
                margin: EdgeInsets.only(bottom: SizeUtils.fSize_10()),
                isShadow: false,
                borderColor: option == data.title
                    ? AppColors.primaryColor
                    : AppColors.white,
                radius: 12.r,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            data.title.toString().tr,
                            style: AppCss.soraMedium16.copyWith(
                              color: option == data.title
                                  ? AppColors.primaryColor
                                  : AppColors.black,
                            ),
                          ),
                          4.verticalSpace,
                          AppText(
                            data.desc.toString().tr,
                            style: AppCss.soraRegular14,
                          ),
                        ],
                      ),
                    ),
                    if (option == data.title)
                      SvgPicture.asset(AppSvg.check).paddingOnly(right: SizeUtils.fSize_10()),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
