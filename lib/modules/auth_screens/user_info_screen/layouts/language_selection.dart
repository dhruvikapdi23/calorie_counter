import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:calorie_counter/models/language_model.dart';

import '../../../../app_config.dart';

class LanguageSelection extends StatelessWidget {
  final String? language;
  final Function(LanguageModel) onTap;

  const LanguageSelection({
    super.key,
     this.language,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 19,
      children: [
        ListView.builder(
          itemCount: AppArray.languageList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            LanguageModel data = AppArray.languageList[index];
          return Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: language == data.code ? AppColors.primaryColor:AppColors.white),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (language == data.code)
                      SvgPicture.asset(AppSvg.check).paddingOnly(right: 10),
                    Text(data.title.toString().tr,style:AppCss.soraMedium16.copyWith(color: language == data.code? AppColors.primaryColor:AppColors.black) )
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
