import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/extension/widget_extension.dart';

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

  static Widget commonCircleIcon(icon) => Container(
    alignment: Alignment.center,
    height: 48,
    width: 48,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: AppColors.white,
      boxShadow: [
        BoxShadow(
          color: AppColors.white.withValues(alpha: .05),
          offset: Offset(0, 10),
          blurRadius: 20,
        ),
      ],
    ),
    child: SvgPicture.asset(icon),
  );

  static Widget commonKgCmSuffixIcon(text, {double? width}) => Container(
    margin: EdgeInsets.all(8),
    height: 30,
    width: width ?? 30,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: AppColors.lightPrimaryColor,
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: AppColors.primaryColor, width: .8),
    ),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: AppCss.soraRegular14.copyWith(color: AppColors.primaryColor),
    ),
  );

  static Widget commonMinusPlus(svg) => Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: AppColors.primaryColor,
      borderRadius: BorderRadius.circular(5),
    ),
    child: SvgPicture.asset(svg),
  );

  static Widget displayOfResultByOrder(title, selected) => Container(
    padding: EdgeInsets.all(13),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: selected == title
          ? AppColors.primaryColor
          : AppColors.lightGrey.withValues(alpha: .20),
      borderRadius: BorderRadius.circular(selected == title ? 12 : 6),
    ),
    child: Text(
      title.toString().tr,
      style: selected == title
          ? AppCss.soraMedium14.copyWith(color: AppColors.white)
          : AppCss.soraRegular14.copyWith(color: AppColors.gary),
    ),
  );

  static Widget caloriesGram(title, value) => Column(
    spacing: 3,
    crossAxisAlignment: title == Fonts.max
        ? CrossAxisAlignment.end
        : CrossAxisAlignment.start,
    children: [
      Text(
        title.toString().tr,
        style: AppCss.soraMedium12.copyWith(color: AppColors.gary),
      ),
      Text("$value ${Fonts.kcal.tr}", style: AppCss.soraRegular16),
    ],
  );

  static Widget buildFilterChip(
    String label, {
    bool isSelected = false,
    GestureTapCallback? onTap,
  }) {
    return Container(
      child: Text(
        label,
        style: AppCss.soraRegular12.copyWith(
          color: isSelected ? Colors.white : AppColors.gary,
        ),
      ),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : AppColors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isSelected ? AppColors.primaryColor : AppColors.strokeColor,
        ),
      ),

      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
    ).inkWell(onTap: onTap);
  }

  static commonContainerClass(Widget child, {EdgeInsets? padding,EdgeInsets? margin}) => Container(
    margin: margin,
    padding: padding,
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
    child: child,
  );


  static Widget discoverDetailFeature(title)=> Row(
    children: [
      Container(
        height: 4,
        width: 4,
        color: AppColors.white,
      ),
      HSpace(12),
      Text(title,style: AppCss.soraMedium16.copyWith(color: AppColors.white),),
    ],
  );
}
