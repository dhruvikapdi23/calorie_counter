import 'package:calorie_counter/extension/widget_extension.dart';

import '../../../../app_config.dart';

class LanguageSelection extends StatelessWidget {
  final String? language;
  final Function(dynamic) onTap;

  const LanguageSelection({
    super.key,
     this.language,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 19,
        children: [
          ...AppArray.languageList.asMap().entries.map(
            (e) => Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: language == e.value['code'] ? AppColors.primaryColor:AppColors.white),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (language == e.value['code'])
                        SvgPicture.asset(AppSvg.check).paddingOnly(right: 10),
                      Text(e.value['title'].toString().tr,style:AppCss.soraMedium16.copyWith(color: language == e.value['code']? AppColors.primaryColor:AppColors.black) )
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
