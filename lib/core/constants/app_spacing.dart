import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSpacing {
  AppSpacing._();

  static double get xs => 4.0.w;
  static double get sm => 8.0.w;
  static double get md => 16.0.w;
  static double get lg => 24.0.w;
  static double get xl => 32.0.w;
  static double get xxl => 48.0.w;

  static EdgeInsets get paddingXs => EdgeInsets.all(xs);
  static EdgeInsets get paddingSm => EdgeInsets.all(sm);
  static EdgeInsets get paddingMd => EdgeInsets.all(md);
  static EdgeInsets get paddingLg => EdgeInsets.all(lg);
  static EdgeInsets get paddingXl => EdgeInsets.all(xl);

  static EdgeInsets get horizontalMd => EdgeInsets.symmetric(horizontal: md);
  static EdgeInsets get verticalMd => EdgeInsets.symmetric(vertical: md);

  static double get radiusSm => 8.0.r;
  static double get radiusMd => 12.0.r;
  static double get radiusLg => 16.0.r;
  static double get radiusXl => 24.0.r;
  static double get radiusFull => 999.0.r;
}
