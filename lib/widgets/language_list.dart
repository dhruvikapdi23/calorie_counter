import 'package:calorie_counter/extension/widget_extension.dart';

import '../app_config.dart';

class LanguageList extends StatelessWidget {
  final dynamic selectedLanguage;
  final Function(dynamic)? onTap;
  final Color? color;

  const LanguageList(
      {super.key, this.selectedLanguage, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: AppArray()
            .languageList
            .asMap()
            .entries
            .map((e) => Container(
                  padding: EdgeInsets.only(left: AppDimens.dimenW37),
                  height: AppDimens.dimen60,
                  margin: EdgeInsets.only(bottom:  e.key != AppArray()
                      .languageList.length? AppDimens.dimen20:0),
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(e.value['icon'].toString(),
                                  width: AppDimens.dimen36,
                                  height: AppDimens.dimen36)
                              .paddingOnly(left: AppDimens.dimenW36),
                          HSpace(AppDimens.dimen22),
                          Text(e.value['title'].toString().tr,
                              style: Get.theme.textTheme.titleSmall!
                                  .copyWith(fontFamily: "SfPro"))
                        ],
                      ),
                   /*   if (selectedLanguage != null &&
                          selectedLanguage['title'] == e.value['title'])
                        Image.asset(AppImages.check,
                                height: AppDimens.dimen38,
                                width: AppDimens.dimen38)
                            .marginOnly(right: AppDimens.dimen20)*/
                    ],
                  ).inkWell(onTap: () => onTap!(e.value)),
                ))
            .toList());
  }
}
