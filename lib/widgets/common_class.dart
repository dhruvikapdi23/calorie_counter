import 'package:calorie_counter/app_config.dart';

class CommonClass {
  static Widget commonWeightHeightTextLayout(context, title, value) =>
      Container(
        width: MediaQuery.sizeOf(context).width,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.white.withValues(alpha: .05),
              offset: Offset(0, 10),
              blurRadius: 20,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppCss.soraSemiBold18),
            VSpace(6),
            Text(
              value,
              style: AppCss.soraBold28.copyWith(color: AppColors.primaryColor),
            ),
            VSpace(10),
            Text(
              Fonts.lookingStringAndConfident.tr,
              style: AppCss.soraRegular14,
            ),
          ],
        ),
      );

  static Widget commonBgCircleIcon(icon) => Stack(
    alignment: Alignment.center,
    children: [SvgPicture.asset(AppSvg.bgCircle), SvgPicture.asset(icon)],
  );

  static Widget commonKgCmSuffixIcon(text) => Container(
    margin: EdgeInsets.all(8),
    height: 30,
    width: 30,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: AppColors.lightPrimaryColor,
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: AppColors.primaryColor, width: .8),
    ),
    child: Text(
      text,
      style: AppCss.soraRegular14.copyWith(color: AppColors.primaryColor),
    ),
  );


  static Widget commonMinusPlus(svg)=>  Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(5)
    ),
    child: SvgPicture.asset(svg),
  );
}
