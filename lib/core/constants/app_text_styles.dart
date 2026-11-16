import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String fontFamily = 'Satoshi';

  static TextStyle satoshi({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
    FontStyle? fontStyle,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
      fontStyle: fontStyle,
      decoration: decoration,
    );
  }

  // Common pre-configured Satoshi styles
  static TextStyle get displayLarge => satoshi(
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
  );

  static TextStyle get displayMedium => satoshi(
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.3,
  );

  static TextStyle get titleLarge =>
      satoshi(fontSize: 18.sp, fontWeight: FontWeight.w700);

  static TextStyle get titleMedium =>
      satoshi(fontSize: 15.sp, fontWeight: FontWeight.w600);

  static TextStyle get sectionHeader =>
      satoshi(fontSize: 12.sp, fontWeight: FontWeight.w700, letterSpacing: 1.2);

  static TextStyle get bodyLarge =>
      satoshi(fontSize: 14.sp, fontWeight: FontWeight.w400, height: 1.5);

  static TextStyle get bodyMedium =>
      satoshi(fontSize: 13.sp, fontWeight: FontWeight.w400, height: 1.45);

  static TextStyle get bodySmall =>
      satoshi(fontSize: 12.sp, fontWeight: FontWeight.w400);

  static TextStyle get labelMedium =>
      satoshi(fontSize: 13.sp, fontWeight: FontWeight.w600);

  static TextStyle get labelSmall =>
      satoshi(fontSize: 11.sp, fontWeight: FontWeight.w500);

  // Italic helper
  static TextStyle italic({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
  }) {
    return satoshi(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
      fontStyle: FontStyle.italic,
    );
  }
}
