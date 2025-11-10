import 'package:calorie_counter/extension/widget_extension.dart';

import '../../../../app_config.dart';

class ThankYou extends StatelessWidget {


  const ThankYou({super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppSvg.tick),
        VSpace(14),
        Text(
          Fonts.allDone.tr,
          style: AppCss.soraRegular16,
          textAlign: TextAlign.center,
        ).alignment(Alignment.center),
        VSpace(10),
        Text(
          Fonts.thankYouForYourConfidenceInUs.tr,
          style: AppCss.soraMedium28,
          textAlign: TextAlign.center,
        ).alignment(Alignment.center),
        VSpace(10),
        Text(
          Fonts.thankYouForYourConfidenceInUsDesc.tr,
          style: AppCss.soraRegular14,
          textAlign: TextAlign.center,
        ).paddingSymmetric(horizontal: 44).alignment(Alignment.center),
      ],
    );
  }
}
