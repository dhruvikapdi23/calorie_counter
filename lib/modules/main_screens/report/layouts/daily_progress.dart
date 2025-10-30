import 'package:intl/intl.dart';

import '../../../../app_config.dart';
import '../../../../widgets/custom_animated_circular_chart.dart';

class DailyProgress extends StatelessWidget {
  const DailyProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonClass.commonContainerClass(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 26.5,
        bottom: 12.5,
      ),
      Column(
        children: [
          Text(Fonts.dailyProgress.tr, style: AppCss.soraSemiBold24),
          VSpace(10),
          Row(
            spacing: 9,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Today,${DateFormat("MMM dd").format(DateTime.now())} ",
                style: AppCss.soraMedium14.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              SvgPicture.asset(
                AppSvg.calendar,
                colorFilter: ColorFilter.mode(
                  AppColors.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
          VSpace(14),
          Text(
            Fonts.exerciseAccording.tr,
            style: AppCss.soraRegular14.copyWith(color: AppColors.gary),
          ),
          VSpace(30),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: 4,
                children: [
                  Row(
                    spacing: 5,
                    children: [
                      SvgPicture.asset(AppSvg.eaten),
                      Text(Fonts.eaten.tr, style: AppCss.soraRegular14),
                    ],
                  ),
                  Text("1634", style: AppCss.soraMedium24),
                  Text(
                    "kcal",
                    style: AppCss.soraRegular12.copyWith(color: AppColors.gary),
                  ),
                ],
              ),

              AnimatedCircularInnerShadowChart(
                title: "2560",
                progress: .45,
                subtitle: "kcal left",

                color: AppColors.primaryColor,
                size: 118,
              ),
              Column(
                spacing: 4,
                children: [
                  Row(
                    spacing: 5,
                    children: [
                      SvgPicture.asset(AppSvg.fire),
                      Text(Fonts.burned.tr, style: AppCss.soraRegular14),
                    ],
                  ),
                  Text("265", style: AppCss.soraMedium24),
                  Text(
                    "kcal",
                    style: AppCss.soraRegular12.copyWith(color: AppColors.gary),
                  ),
                ],
              ),
            ],
          ),
          VSpace(16),
          Row(
            spacing: 9,
            children: [
              Text(
                Fonts.eaten,
                style: AppCss.soraRegular16.copyWith(color: AppColors.gary),
              ),
              Expanded(
                child: Divider(height: 1, color: AppColors.gary, thickness: .6),
              ),
            ],
          ),
          VSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: 7,
                children: [
                  AnimatedCircularInnerShadowChart(
                    title: "168g",
                    progress: .40,
                    subtitle: "40%",
                    color: AppColors.red1,
                    //size: 84
                  ),
                  Text(Fonts.carbs.tr, style: AppCss.soraRegular14),
                ],
              ),
              Column(
                spacing: 7,
                children: [
                  AnimatedCircularInnerShadowChart(
                    title: "83g",
                    progress: .45,
                    subtitle: "45%",
                    color: AppColors.orange,
                    //size: 84
                  ),
                  Text(Fonts.protein.tr, style: AppCss.soraRegular14),
                ],
              ),
              Column(
                spacing: 7,
                children: [
                  AnimatedCircularInnerShadowChart(
                    title: "70g",
                    progress: .30,
                    subtitle: "30%",
                    color: AppColors.blue,
                    //size: 84
                  ),
                  Text(Fonts.fat.tr, style: AppCss.soraRegular14),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
