import 'package:calorie_counter/app_config.dart';
import 'package:calorie_counter/extension/widget_extension.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';

class AppCommonLayout {
  Widget richText({title, subTitle, GestureTapCallback? onTap}) {
    return RichText(
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
            text: "${title.toString().tr} ",
            style: Get.theme.textTheme.displaySmall!
                .copyWith(color: AppColors.black, fontSize: 15),
            children: [
              TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = onTap,
                  text: subTitle.toString().tr,
                  style: Get.theme.textTheme.displaySmall!.copyWith(
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                      fontSize: 15))
            ])).center();
  }

  //mulish text style
  TextStyle mulishFW400Or500TextStyle(
          {double? fontSize, FontWeight? fontWeight, Color? color,TextOverflow? overflow}) =>
      Get.theme.textTheme.labelMedium!.copyWith(
          color: color ?? AppColors.black,
          fontSize: fontSize ?? 14,
          overflow:overflow?? TextOverflow.ellipsis,
          fontFamily: GoogleFonts.mulish().fontFamily,
          fontWeight: fontWeight ?? FontWeight.w400);

  //mulish text style
  TextStyle poppinsTextStyle(
          {double? fontSize, FontWeight? fontWeight, Color? color}) =>
      Get.theme.textTheme.displayLarge!.copyWith(
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontSize: fontSize?? 14,
          color: color?? AppColors.black,
          fontWeight: fontWeight?? FontWeight.w600);
}
