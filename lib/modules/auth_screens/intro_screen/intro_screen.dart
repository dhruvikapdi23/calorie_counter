import 'package:sizer/sizer.dart';

import '../../../app_config.dart';
import 'intro_controller.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return GetBuilder<IntroController>(
      init: IntroController(),
      builder: (ctrl) {
        return Scaffold(
          extendBodyBehindAppBar: true, // <--- key part
          appBar: CommonLogoAppBar(title: Row(
            children: [
              CommonClass.commonLogo(),
              HSpace(SizeUtils.fSize_12()),
              Text(Fonts.appName.tr, style: AppCss.soraMedium18),
            ],
          ),),
          body: Stack(
            children: [
              Image.asset(
                AppImages.introBg,
                width: Get.width,
                height: Get.height,
                fit: BoxFit.cover,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    Fonts.yourDailyGuide.tr,
                    style: AppCss.soraMedium34,
                  ),
                  appButton(Fonts.getStarted.tr, onTap: getStartedTap),
                ],
              ).paddingOnly(
                top: SizeUtils.verticalBlockSize * (12),
                left: SizeUtils.fSize_16(),
                right: SizeUtils.fSize_16(),
                bottom: 32.sp,
              ),
            ],
          ),
        );
      }
    );
  }

  void getStartedTap() {
    Navigation.toNamed(RouteName.userInfo);
  }
}
