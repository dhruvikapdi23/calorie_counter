import 'package:calorie_counter/app_config.dart';
import 'completed_comparison_chart.dart';

class CompletedExercise extends StatelessWidget {
  const CompletedExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Column(
            children: [
              VSpace(48),
              Image.asset(AppImages.cup, height: 174),
              VSpace(7),
              AppText(Fonts.congratulations.tr, style: AppCss.soraSemiBold28),
              VSpace(14),
              AppText(
                Fonts.youHaveCompletedTheWorkout.tr,
                style: AppCss.soraRegular18.copyWith(color: AppColors.gary),
              ),
            ],
          ),
          VSpace(24),
          SizedBox(
            height: 103,
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                dynamic data = AppArray.completedFinalResult[index];
                return Container(
                  height: 96,
                  width: 118,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withValues(alpha: .05),
                        offset: Offset(0, 10),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 5,
                        children: [
                          SvgPicture.asset(data['icon'], height: 14),
                          AppText(
                            data['title'].toString().tr,
                            style: AppCss.soraMedium12,
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        AppSvg.horizontalLine,
                      ).paddingSymmetric(vertical: 8),
                      AppText(
                        data['result'],
                        style: AppCss.soraSemiBold22.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      AppText(data['key'], style: AppCss.soraRegular10),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => HSpace(10),
              itemCount: AppArray.completedFinalResult.length,
            ),
          ),
          VSpace(16),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  Fonts.weightLoss.tr,
                  style: AppCss.soraRegular16.copyWith(color: AppColors.black),
                ),
                VSpace(16),
                CompletedComparisonChart(
                  beforeDiscount: 2000,
                  afterDiscount: 80000,
                ),
              ],
            ),
          ),
          VSpace(14.5),
          appButton(Fonts.nextToWorkout.tr),
          VSpace(16),
          appButton(
            Fonts.home.tr,
            color: AppColors.white,
            bColor: AppColors.strokeColor,
            style: AppCss.soraSemiBold16.copyWith(color: AppColors.black),
            onTap: ()=>Get.offAllNamed(RouteName.dashboard)
          ),
          VSpace(16),
        ],
      ),
    );
  }
}
