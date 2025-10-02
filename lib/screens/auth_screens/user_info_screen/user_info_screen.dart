import 'dart:developer';

import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:calorie_counter/screens/auth_screens/splash_screen/splash_controller.dart';
import 'package:calorie_counter/screens/auth_screens/user_info_screen/user_info_controller.dart';
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
                      SvgPicture.asset(AppSvg.arrowLeft)
                          .paddingAll(12)
                          .decorated(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.black.withValues(alpha: .05),
                                offset: Offset(0, 10),
                                blurRadius: 20,
                              ),
                            ],
                          ),
                      Expanded(
                        child: LinearPercentIndicator(
                          animation: true,
                          animateFromLastPercent: false,
                          lineHeight: Sizes.s8,

                          barRadius: const Radius.circular(AppRadius.r8),
                          percent: (ctrl.currentStep + 1) / 15,
                          // 0 → 1 range
                          backgroundColor: AppColors.white,
                          progressColor: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  VSpace(9),
                  Text(
                    Fonts.whatsYourGender.tr,
                    style: AppCss.soraSemiBold22,
                  ).alignment(Alignment.center),
                  VSpace(6),
                  Text(
                    Fonts.selectYourGender.tr,
                    style: AppCss.soraRegular14,
                    textAlign: TextAlign.center,
                  ).alignment(Alignment.center),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 19,
                children: [
                  ...[{"title":"Male","image":AppImages.boy},{"title":"Female","image":AppImages.girl}]
                      .asMap()
                      .entries.map((e) =>    Column(
                    spacing: 10,
                        children: [
                          Container(
                                              height: 142,
                                              width: 142,
                                              decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                                                border:  Border.all(color:ctrl.gender ==e.value['title']? AppColors.primaryColor:AppColors.white)

                                              ),
                                              padding: EdgeInsets.all(8),
                                              child: Container(
                          height: 126,
                          width: 126,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(e.value['image'].toString()),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                          ),
                                              ),
                                            ),
                          Text(e.value['title'].toString(),style: AppCss.soraMedium20,)
                        ],
                      ).inkWell(onTap: ()=> ctrl.genderSelect(e.value['title'])),)

                ],
              ),
              appButton(Fonts.next.tr),

            ],
          ).padding(horizontal: 16,bottom: 40),
        );
      },
    );
  }
}
