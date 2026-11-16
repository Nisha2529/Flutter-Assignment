import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTypography {
  AppTypography._();

  static TextStyle get displayLarge => TextStyle(
    fontFamily: AppTextStyles.fontFamily,
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
    letterSpacing: -0.5,
  );

  static TextStyle get displayMedium => TextStyle(
    fontFamily: AppTextStyles.fontFamily,
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
    letterSpacing: -0.3,
  );

  static TextStyle get titleLarge => TextStyle(
    fontFamily: AppTextStyles.fontFamily,
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  static TextStyle get titleMedium => TextStyle(
    fontFamily: AppTextStyles.fontFamily,
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static TextStyle get sectionHeader => TextStyle(
    fontFamily: AppTextStyles.fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textSecondary,
    letterSpacing: 1.2,
  );

  static TextStyle get bodyLarge => TextStyle(
    fontFamily: AppTextStyles.fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
    height: 1.5,
  );

  static TextStyle get bodyMedium => TextStyle(
    fontFamily: AppTextStyles.fontFamily,
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.45,
  );

  static TextStyle get bodySmall => TextStyle(
    fontFamily: AppTextStyles.fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );

  static TextStyle get labelMedium => TextStyle(
    fontFamily: AppTextStyles.fontFamily,
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static TextStyle get labelSmall => TextStyle(
    fontFamily: AppTextStyles.fontFamily,
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );
}
