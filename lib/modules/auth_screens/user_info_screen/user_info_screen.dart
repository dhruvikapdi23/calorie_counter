import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:calorie_counter/modules/auth_screens/user_info_screen/user_info_controller.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../app_config.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserInfoController>(
      init: UserInfoController(),
      builder: (ctrl) {
        return Scaffold(
          bottomNavigationBar:
              appButton(
                ctrl.currentStep == 12 ? Fonts.createMyPlan.tr : Fonts.next.tr,
                onTap: () => onTap(ctrl),
              ).padding(
                horizontal: SizeUtils.fSize_16(),
                vertical: SizeUtils.verticalBlockSize * 4.5,
              ),
          appBar: AppBar(
            automaticallyImplyLeading: false,

            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: SizeUtils.fSize_10(),
              children: [
                Text(Fonts.calorie.tr, style: AppCss.soraMedium18),
                CommonClass.commonLogo(),
                Text(Fonts.counter.tr, style: AppCss.soraMedium18),
              ],
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    spacing: SizeUtils.fSize_16(),
                    children: [
                      CommonBackCircle(onTap: () => onBack(ctrl)),
                      Expanded(
                        child: LinearPercentIndicator(
                          animation: true,
                          animateFromLastPercent: false,
                          lineHeight: Sizes.s8,

                          barRadius: const Radius.circular(AppRadius.r8),
                          percent: (ctrl.currentStep + 1) / 13,
                          // 0 → 1 range
                          backgroundColor: AppColors.white,
                          progressColor: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  VSpace(SizeUtils.verticalBlockSize *.9),
                  ctrl.currentStep == 12
                      ? Container()
                      : ctrl.currentStep == 9
                      ? AppText(
                          AppArray.userInfoTitleSection[ctrl.currentStep].title
                              .toString()
                              .tr,

                          style: AppCss.soraMedium16,
                          textAlign: TextAlign.start,
                        )
                      : Column(
                          children: [
                            AppText(
                              AppArray
                                  .userInfoTitleSection[ctrl.currentStep]
                                  .title
                                  .toString()
                                  .tr,
                              style: AppCss.soraSemiBold22,
                              textAlign: TextAlign.center,
                            ).alignment(Alignment.center),
                            VSpace(SizeUtils.verticalBlockSize *.6),
                            AppText(
                              AppArray
                                  .userInfoTitleSection[ctrl.currentStep]
                                  .desc
                                  .toString()
                                  .tr,
                              style: AppCss.soraRegular14,
                              textAlign: TextAlign.center,
                            ).alignment(Alignment.center),
                          ],
                        ),
                ],
              ),
              // PageView for carousel effect
              Expanded(
                child: PageView(
                  controller: ctrl.pageController,
                  allowImplicitScrolling: false,
                  physics: NeverScrollableScrollPhysics(),

                  children: ctrl.pages,
                ),
              ),
            ],
          ).padding(horizontal: SizeUtils.fSize_16()),
        );
      },
    );
  }

  void onTap(UserInfoController ctrl) {
    ctrl.nextTo();
  }

  void onBack(UserInfoController ctrl) {
    ctrl.onBack();
  }
}
