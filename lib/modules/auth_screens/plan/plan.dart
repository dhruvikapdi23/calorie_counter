import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:calorie_counter/modules/auth_screens/plan/plan_controller.dart';

class Plan extends StatelessWidget {
  const Plan({super.key});

  @override
  Widget build(BuildContext context) {
    final steps = [
      StepData(
        title: "Unlock Everything",
        highlightText: "Today",
        subtitle: "Easily Track Meals, Scan Calories & Stay on Target!",
      ),
      StepData(
        title: "Your Trial Ends in",
        highlightText: "2 Days",
        subtitle:
        "Don’t worry — we’ll send you a quick reminder so you can decide what’s next!",
      ),
      StepData(
        title: "Enjoy",
        highlightText: "3 Days Free!",
        subtitle:
        "Billing begins on June 22, 2025 unless you cancel before then.",
      ),
    ];
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
              Text(
                Fonts.skip.tr,
                style: AppCss.soraRegular12,
              ).inkWell(onTap: ()=>Get.offAllNamed(RouteName.dashboard)).paddingSymmetric(horizontal: 16),
            ],
          ),
          bottomNavigationBar: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              appButton(Fonts.continueBtn.tr,onTap: ()=>Get.offAllNamed(RouteName.dashboard)),
              VSpace(10),
              Text(Fonts.priceFree,style: AppCss.soraMedium11,),
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
                      style: AppCss.soraSemiBold26.copyWith(color: AppColors.black),
                    ),
                  ],
                ),
              ).center(),
              VSpace(5),
              Text(Fonts.unlockPremium.tr, style: AppCss.soraRegular13),
              VSpace(25),
              ModernStepper(
                currentStep: ctrl.currentStep,
                steps: steps,
              ).paddingSymmetric(horizontal: 16,vertical: 30).decorated(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12)
              ),
              VSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _PlanCard(
                      title: "Monthly 👆",
                      price: "\$99.99",
                      duration: "/month",
                      isSelected: ctrl.selectedPlan == "monthly",
                      onTap: () =>ctrl.selectPlan("monthly"),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: _PlanCard(
                      title: "Annually",
                      price: "\$299.00",
                      duration: "/year",
                      tagText: "3 Day’s Free",
                      isSelected: ctrl.selectedPlan == "yearly",
                      onTap: () =>ctrl.selectPlan("yearly"),
                    ),
                  ),
                ],
              ),
              VSpace(32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppSvg.tick,height: 16,),
                  HSpace(3),
                  Text(Fonts.youWantBeCharge.tr.toUpperCase(),style: AppCss.soraRegular11,)
                ],
              )
            ],
          ),
        );
      }
    );
  }
}

class _PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String duration;
  final bool isSelected;
  final String? tagText;
  final VoidCallback onTap;

  const _PlanCard({
    required this.title,
    required this.price,
    required this.duration,
    required this.isSelected,
    required this.onTap,
    this.tagText,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = AppColors.primaryColor;
    final inactiveColor = AppColors.lightGrey;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? AppColors.primaryColor.withValues(alpha: .30) : Colors.transparent,
                width: 3,
              ),

            ),
            child: AnimatedContainer(
              width: MediaQuery.sizeOf(context).width,
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isSelected ? activeColor : inactiveColor,
                  width: 1,
                ),
            
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Row
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
            
                  // Price Text
                  RichText(
                    text: TextSpan(
                      text: price,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: duration,
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 17,
              height: 17,
              margin: EdgeInsets.symmetric(horizontal: 9,vertical: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? activeColor : Colors.white,
                border: Border.all(
                  color: isSelected ? activeColor : inactiveColor,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? SvgPicture.asset(AppSvg.tick1).paddingAll(3)
                  : null,
            ),
          ),
          // Tag badge (if any)
          if (tagText != null)
            Positioned(
              top: -12,
              left: 21,
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: activeColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  tagText!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}


class ModernStepper extends StatelessWidget {
  final int currentStep;
  final List<StepData> steps;
  final Color activeColor;
  final Color inactiveColor;

  const ModernStepper({
    super.key,
    required this.currentStep,
    required this.steps,
    this.activeColor = const Color(0xFF8B4513), // warm brown tone
    this.inactiveColor = const Color(0xFFE0E0E0),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(steps.length, (index) {
        final isActive = index == currentStep;
        final isCompleted = index < currentStep;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Step indicator + connector
            Column(
              children: [
                // Circle icon
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color:isActive || isCompleted
                        ? AppColors.primaryColor
                        : AppColors.lightGrey,
                    shape: BoxShape.circle,
                  ),
                  child:isActive ||  isCompleted
                      ?  SvgPicture.asset(AppSvg.tick1).paddingAll(5)
                      : null,
                ),

                // Connector line

                  Container(
                    width: 2,
                    margin: EdgeInsets.symmetric(vertical: 6),
                    height:index != steps.length - 1? 56:36,
                    color: isActive ||isCompleted
                        ? AppColors.primaryColor
                        : AppColors.lightGrey,
                  ),
              ],
            ),
            HSpace(25),

            // Step content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: steps[index].title,
                        style: AppCss.soraSemiBold16,
                        children: [
                          if (steps[index].highlightText != null)
                            TextSpan(
                              text: " ${steps[index].highlightText!}",
                              style:AppCss.soraSemiBold16.copyWith(color: AppColors.primaryColor)
                            ),
                        ],
                      ),
                    ),
                    VSpace(6),
                    Text(
                      steps[index].subtitle,
                      style:AppCss.soraRegular12.copyWith(color: AppColors.gary)
                    ),
                    const SizedBox(height: 26),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class StepData {
  final String title;
  final String? highlightText;
  final String subtitle;

  StepData({
    required this.title,
    required this.subtitle,
    this.highlightText,
  });
}
