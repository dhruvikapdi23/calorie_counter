import 'package:calorie_counter/app_config.dart';

import 'custom_animated_circular_chart.dart';

class CommonEatenChart extends StatelessWidget {
  const CommonEatenChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                    AppText(Fonts.eaten.tr, style: AppCss.soraRegular14),
                  ],
                ),
                AppText("1634", style: AppCss.soraMedium24),
                AppText(
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
                    AppText(Fonts.burned.tr, style: AppCss.soraRegular14),
                  ],
                ),
                AppText("265", style: AppCss.soraMedium24),
                AppText(
                  Fonts.kcal.tr,
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
    );
  }
}
