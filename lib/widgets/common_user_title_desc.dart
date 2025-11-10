import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_config.dart';

class CommonUserTitleDesc extends StatelessWidget {
  final int index;
  const CommonUserTitleDesc({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          AppArray
              .userInfoTitleSection[index]
              .title
              .toString()
              .tr,
          style: AppCss.soraSemiBold22,
          textAlign: TextAlign.center,
        ).alignment(Alignment.center),
        VSpace(SizeUtils.verticalBlockSize *.6),
        AppText(
          AppArray
              .userInfoTitleSection[index]
              .desc
              .toString()
              .tr,
          style: AppCss.soraRegular14,
          textAlign: TextAlign.center,
        ).alignment(Alignment.center),
      ],
    ).paddingOnly(bottom: 30.sp);
  }
}
