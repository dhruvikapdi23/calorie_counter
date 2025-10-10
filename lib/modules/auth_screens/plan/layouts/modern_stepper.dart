import '../../../../app_config.dart';
import '../../../../models/step_data.dart';

class ModernStepper extends StatelessWidget {
  final int currentStep;
  final List<StepData> steps;

  const ModernStepper({
    super.key,
    required this.currentStep,
    required this.steps,

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
