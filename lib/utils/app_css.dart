import 'dart:ui';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
part 'scale.dart';


FontWeight thin = FontWeight.w100;
FontWeight extraLight = FontWeight.w200;
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.normal;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;
FontWeight extraThickBold = FontWeight.bold;


//sora font
  TextStyle sora({double? fontsize, fontWeight}) =>
     GoogleFonts.sora(fontSize: fontsize, fontWeight: fontWeight);

class AppCss {

//Text Style sora extra bold
  static TextStyle soraExtraBold70 = sora( fontWeight: extraBold,fontsize:FontSizes.f70);
  static TextStyle soraExtraBold65 = sora( fontWeight:extraBold ,fontsize:FontSizes.f65);
  static TextStyle soraExtraBold60 = sora( fontWeight: extraBold,fontsize:FontSizes.f60);
  static TextStyle soraExtraBold40 = sora( fontWeight: extraBold,fontsize:FontSizes.f40);
  static TextStyle soraExtraBold20 = sora( fontWeight: extraBold,fontsize:FontSizes.f20);
  static TextStyle soraExtraBold25 = sora( fontWeight:extraBold ,fontsize:FontSizes.f25);
  static TextStyle soraExtraBold30 = sora( fontWeight: extraBold,fontsize:FontSizes.f30);

  //Text Style sora bold
  static TextStyle sorablack28 = sora(fontWeight: black,fontsize:FontSizes.f28);
  static TextStyle sorablack24 = sora(fontWeight: black,fontsize:FontSizes.f24);
  static TextStyle sorablack20 = sora(fontWeight: black,fontsize:FontSizes.f20);
  static TextStyle sorablack18 = sora(fontWeight: black,fontsize:FontSizes.f18);
  static TextStyle sorablack16 = sora(fontWeight: black,fontsize:FontSizes.f16);
  static TextStyle sorablack14 = sora(fontWeight: black,fontsize:FontSizes.f14);


  //Text Style sora bold
  static TextStyle soraExtraBold22 = sora(fontWeight: extraBold,fontsize:FontSizes.f22);
  static TextStyle soraExtraBold18 = sora(fontWeight: extraBold,fontsize:FontSizes.f18);
  static TextStyle soraExtraBold16 = sora(fontWeight: extraBold,fontsize:FontSizes.f16);
  static TextStyle soraExtraBold14 = sora(fontWeight: extraBold,fontsize:FontSizes.f14);
  static TextStyle soraExtraBold12 = sora(fontWeight: extraBold,fontsize:FontSizes.f12);

  //Text Style semi sora bold
  static TextStyle soraBold50 = sora(fontWeight: bold,fontsize:FontSizes.f50);
  static TextStyle soraBold38 = sora(fontWeight: bold,fontsize:FontSizes.f38);
  static TextStyle soraBold35 = sora(fontWeight: bold,fontsize:FontSizes.f35);
  static TextStyle soraBold28 = sora(fontWeight: bold,fontsize:FontSizes.f28);
  static TextStyle soraBold24 = sora(fontWeight: bold,fontsize:FontSizes.f24);
  static TextStyle soraBold20 = sora(fontWeight: bold,fontsize:FontSizes.f20);
  static TextStyle soraBold18 = sora(fontWeight: bold,fontsize:FontSizes.f18);
  static TextStyle soraBold16 = sora(fontWeight: bold,fontsize:FontSizes.f16);
  static TextStyle soraBold15 = sora(fontWeight: bold,fontsize:FontSizes.f15);
  static TextStyle soraBold17 = sora(fontWeight: bold,fontsize:FontSizes.f17);
  static TextStyle soraBold14 = sora(fontWeight: bold,fontsize:FontSizes.f14);
  static TextStyle soraBold12 = sora(fontWeight: bold,fontsize:FontSizes.f12);
  static TextStyle soraBold10 = sora(fontWeight: bold,fontsize:FontSizes.f10);

  static TextStyle soraSemiBold24= sora(fontWeight: semiBold,fontsize:FontSizes.f24);
  static TextStyle soraSemiBold22= sora(fontWeight: semiBold,fontsize:FontSizes.f22);
  static TextStyle soraSemiBold20= sora(fontWeight: semiBold,fontsize:FontSizes.f20);
  static TextStyle soraSemiBold18= sora(fontWeight: semiBold,fontsize:FontSizes.f18);
  static TextStyle soraSemiBold16= sora(fontWeight: semiBold,fontsize:FontSizes.f16);
  static TextStyle soraSemiBold15= sora(fontWeight: semiBold,fontsize:FontSizes.f15);
  static TextStyle soraSemiBold13= sora(fontWeight: semiBold,fontsize:FontSizes.f13);
  static TextStyle soraSemiBold14= sora(fontWeight: semiBold,fontsize:FontSizes.f14);
  static TextStyle soraSemiBold12= sora(fontWeight: semiBold,fontsize:FontSizes.f12);
  static TextStyle soraSemiBold11= sora(fontWeight: semiBold,fontsize:FontSizes.f11);
  static TextStyle soraSemiBold10= sora(fontWeight: semiBold,fontsize:FontSizes.f10);


  //Text Style sora medium
  static TextStyle soraMedium40 = sora(fontWeight: medium,fontsize:FontSizes.f40);
  static TextStyle soraMedium34 = sora(fontWeight: medium,fontsize:FontSizes.f34);
  static TextStyle soraMedium28 = sora(fontWeight: medium,fontsize:FontSizes.f28);
  static TextStyle soraMedium24 = sora(fontWeight: medium,fontsize:FontSizes.f24);
  static TextStyle soraMedium22 = sora(fontWeight: medium,fontsize:FontSizes.f22);
  static TextStyle soraMedium20 = sora(fontWeight: medium,fontsize:FontSizes.f20);
  static TextStyle soraMedium18 = sora(fontWeight: medium,fontsize:FontSizes.f18);
  static TextStyle soraMedium16 = sora(fontWeight: medium,fontsize:FontSizes.f16);
  static TextStyle soraMedium15 = sora(fontWeight: medium,fontsize:FontSizes.f15);
  static TextStyle soraMedium14 = sora(fontWeight: medium,fontsize:FontSizes.f14);
  static TextStyle soraMedium13 = sora(fontWeight: medium,fontsize:FontSizes.f13);
  static TextStyle soraMedium12 = sora(fontWeight: medium,fontsize:FontSizes.f12);
  static TextStyle soraMedium11 = sora(fontWeight: medium,fontsize:FontSizes.f11);
  static TextStyle soraMedium10 = sora(fontWeight: medium,fontsize:FontSizes.f10);
  static TextStyle soraMedium8 = sora(fontWeight: medium,fontsize:FontSizes.f8);

  //Text Style sora regular
  static TextStyle soraRegular48 = sora(fontWeight: regular,fontsize:FontSizes.f48);
  static TextStyle soraRegular24 = sora(fontWeight: regular,fontsize:FontSizes.f24);
  static TextStyle soraRegular20 = sora(fontWeight: regular,fontsize:FontSizes.f20);
  static TextStyle soraRegular18 = sora(fontWeight: regular,fontsize:FontSizes.f18);
  static TextStyle soraRegular16 = sora(fontWeight: regular,fontsize:FontSizes.f16);
  static TextStyle soraRegular14 = sora(fontWeight: regular,fontsize:FontSizes.f14);
  static TextStyle soraRegular13 = sora(fontWeight: regular,fontsize:FontSizes.f13);
  static TextStyle soraRegular12 = sora(fontWeight: regular,fontsize:FontSizes.f12);
  static TextStyle soraRegular11 = sora(fontWeight: regular,fontsize:FontSizes.f11);
  static TextStyle soraRegular10 = sora(fontWeight: regular,fontsize:FontSizes.f10);


  static TextStyle soraLight16 = sora(fontWeight: light,fontsize:FontSizes.f16);
  static TextStyle soraLight14 = sora(fontWeight: light,fontsize:FontSizes.f14);
  static TextStyle soraLight13 = sora(fontWeight: light,fontsize:FontSizes.f13);
  static TextStyle soraLight12 = sora(fontWeight: light,fontsize:FontSizes.f12);
  static TextStyle soraLight10 = sora(fontWeight: light,fontsize:FontSizes.f10);


}
