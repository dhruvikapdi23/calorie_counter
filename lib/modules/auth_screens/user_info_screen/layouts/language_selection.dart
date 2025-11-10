import 'package:calorie_counter/models/language_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_config.dart';
import '../../../../widgets/common_user_title_desc.dart';

class LanguageSelection extends StatelessWidget {
  final String? language;
  final Function(LanguageModel) onTap;
  final bool isLanguageScreen;
  final int? index;

  const LanguageSelection({
    super.key,
    this.language,
    required this.onTap,
    this.isLanguageScreen = false,  this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CommonUserTitleDesc(index: index!),
          ListView.builder(
            itemCount: AppArray.languageList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(bottom: 20.sp),
            itemBuilder: (context, index) {
              LanguageModel data = AppArray.languageList[index];
              return  InkWell(
                  onTap: () => onTap(data),
                child: CommonClass.commonContainerClass(
                  padding: EdgeInsets.all(SizeUtils.fSize_16()),
                  margin: EdgeInsets.only(bottom: SizeUtils.fSize_10()),
                  isShadow: false,
                  borderColor: language == data.code
                      ? AppColors.primaryColor
                      : AppColors.white,
                  radius: 12.r,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          if (language == data.code)
                            SvgPicture.asset(
                              AppSvg.check,
                            ).paddingOnly(right: 10.sp),
                          AppText(
                            data.title.toString().tr,
                            style: AppCss.soraMedium16.copyWith(
                              color: language == data.code
                                  ? AppColors.primaryColor
                                  : AppColors.black,
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset(data.icon!),
                    ],
                  ),
                ),
              );
            },
          ).paddingOnly(top: isLanguageScreen ? 16.sp : 0),
        ],
      ),
    );
  }
}
