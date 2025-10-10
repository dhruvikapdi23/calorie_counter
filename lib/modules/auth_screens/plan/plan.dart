import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:calorie_counter/modules/auth_screens/plan/plan_controller.dart';

import 'layouts/modern_stepper.dart';
import 'layouts/plan_card.dart';

class Plan extends StatelessWidget {
  const Plan({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlanController>(
      init: PlanController(),
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              spacing: 10,
              children: [
                CommonBackCircle(onTap: () => Get.back()),
                Text(
                  Fonts.subscriptionPlans.tr.toUpperCase(),
                  style: AppCss.soraMedium16,
                ),
              ],
            ),
            actions: [
              Text(Fonts.skip.tr, style: AppCss.soraRegular12)
                  .inkWell(onTap: goToDashboard)
                  .paddingSymmetric(horizontal: 16),
            ],
          ),
          bottomNavigationBar: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              appButton(
                Fonts.continueBtn.tr,
                onTap: goToDashboard,
              ),
              VSpace(10),
              Text(Fonts.priceFree.tr, style: AppCss.soraMedium11),
              VSpace(30),
            ],
          ).paddingSymmetric(horizontal: 16),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 19),
            children: [
              RichText(
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: Fonts.enjoy.tr,
                  style: AppCss.soraSemiBold26.copyWith(color: AppColors.black),
                  children: [
                    TextSpan(
                      text: " ${Fonts().dayFree("3").tr} ",
                      style: AppCss.soraSemiBold26.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    TextSpan(
                      text: " ${Fonts.getStartedNow.tr} ",
                      style: AppCss.soraSemiBold26.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ).center(),
              VSpace(5),
              Text(Fonts.unlockPremium.tr, style: AppCss.soraRegular13),
              VSpace(25),
              ModernStepper(
                    currentStep: ctrl.currentStep,
                    steps: AppArray.steps,
                  )
                  .paddingSymmetric(horizontal: 16, vertical: 30)
                  .decorated(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
              VSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: PlanCard(
                      title: "Monthly 👆",
                      price: "\$99.99",
                      duration: "/month",
                      isSelected: ctrl.selectedPlan == "monthly",
                      onTap: () => selectPlan("monthly"),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: PlanCard(
                      title: "Annually",
                      price: "\$299.00",
                      duration: "/year",
                      tagText: "3 Day’s Free",
                      isSelected: ctrl.selectedPlan == "yearly",
                      onTap: () => selectPlan("yearly"),
                    ),
                  ),
                ],
              ),
              VSpace(32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppSvg.tick, height: 16),
                  HSpace(3),
                  Text(
                    Fonts.youWantBeCharge.tr.toUpperCase(),
                    style: AppCss.soraRegular11,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }


  void selectPlan(plan){
    final ctrl = Get.find<PlanController>();

    ctrl.selectPlan("yearly");
  }

  void goToDashboard(){
    Get.offAllNamed(RouteName.dashboard);
  }
}
