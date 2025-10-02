import 'package:calorie_counter/utils/app_colors.dart';
import 'package:calorie_counter/utils/app_dimen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final light = ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.lightPrimaryColor,

      iconTheme: const IconThemeData(color: AppColors.black),

      cardColor: AppColors.white,
      hintColor: AppColors.gary,
      primaryColorDark: AppColors.primaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightPrimaryColor
      ),
      dividerColor: AppColors.white,primaryColorLight: AppColors.lightPrimaryColor,
      textTheme: TextTheme(
        //use
        displayLarge: getTextStyle(AppColors.black, FontDimen.dimen24,
            fontWeight: FontWeight.w700),
        //use
        displayMedium: getTextStyle(AppColors.black, FontDimen.dimen18,
            fontWeight: FontWeight.w500),
        //use
        displaySmall: getTextStyle(AppColors.black, FontDimen.dimen20,
            fontWeight: FontWeight.w600),
        headlineLarge: getTextStyle(
          AppColors.black,
          fontWeight: FontWeight.w400,
          FontDimen.dimen18,
        ),
        headlineMedium: getTextStyle(
          AppColors.black,
          fontWeight: FontWeight.w400,
          FontDimen.dimen18,
        ),
        //use
        headlineSmall: getTextStyle(
          AppColors.black,
          fontWeight: FontWeight.w400,
          FontDimen.dimen16,
        ),
        titleLarge: getTextStyle(
          AppColors.black,
          fontWeight: FontWeight.w400,
          FontDimen.dimen16,
        ),
        titleMedium: getTextStyle(
          AppColors.black,
          fontWeight: FontWeight.w400,
          FontDimen.dimen16,
        ),
        //use
        titleSmall: getTextStyle(
            AppColors.black,
            fontWeight: FontWeight.w300,
            FontDimen.dimen15),
        labelLarge: getTextStyle(
          AppColors.black,
          fontWeight: FontWeight.w400,
          FontDimen.dimen16,
        ),
        labelMedium: getTextStyle(
          AppColors.black,
          fontWeight: FontWeight.w400,
          FontDimen.dimen14,
        ),
        labelSmall: getTextStyle(AppColors.black, FontDimen.dimen16,
            fontWeight: FontWeight.w700),
        bodyLarge: getTextStyle(
          AppColors.black,
          fontWeight: FontWeight.w400,
          FontDimen.dimen12,
        ),
        bodyMedium: getTextStyle(
          AppColors.black,
          fontWeight: FontWeight.w400,
          FontDimen.dimen10,
        ),
        bodySmall: getTextStyle(
          AppColors.black,
          fontWeight: FontWeight.w400,
          FontDimen.dimen12,
        ),
      ));
}

TextStyle getTextStyle(Color color, double size,
        {FontWeight? fontWeight, String? fontFamily}) =>
    GoogleFonts.sora(
      color: color,
      fontSize: size,
      fontWeight: fontWeight ?? FontWeight.w400,
      textStyle: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight ?? FontWeight.w400,
      ),
    );
