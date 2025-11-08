import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'size_utils.dart'; // your file where SizeUtils is defined

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? letterSpacing;
  final double? height;
  final TextDecoration? decoration;
  final FontStyle? fontStyle;
  final TextStyle? style;

  const AppText(
    this.text, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.letterSpacing,
    this.height,
    this.decoration,
    this.fontStyle,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.visible,
      style: style,
    );
  }
}
