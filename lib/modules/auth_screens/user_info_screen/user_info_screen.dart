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
          bottomNavigationBar: appButton(
            ctrl.currentStep == 12 ? Fonts.createMyPlan.tr : Fonts.next.tr,
            onTap: () => onTap(ctrl),
          ).padding(horizontal: 16, vertical: 40),
          appBar: AppBar(
            automaticallyImplyLeading: false,

            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Text(Fonts.calorie.tr, style: AppCss.soraMedium18),
                Image(
                  image: const AssetImage(AppImages.logo),
                  height: 40,
                  width: 48,
                ),
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
                    spacing: 16,
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
                  VSpace(9),
                  ctrl.currentStep == 12
                      ? Container()
                      : ctrl.currentStep == 9
                      ? Text(
                          AppArray.userInfoTitleSection[ctrl.currentStep].title
                              .toString()
                              .tr,

                          style: AppCss.soraMedium16,
                          textAlign: TextAlign.start,
                        )
                      : Column(
                          children: [
                            Text(
                              AppArray
                                  .userInfoTitleSection[ctrl.currentStep]
                                  .title
                                  .toString()
                                  .tr,
                              style: AppCss.soraSemiBold22,
                              textAlign: TextAlign.center,
                            ).alignment(Alignment.center),
                            VSpace(6),
                            Text(
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
          ).padding(horizontal: 16),
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
