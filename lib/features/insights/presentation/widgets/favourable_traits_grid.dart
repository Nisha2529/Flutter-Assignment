import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';

class FavourableTraitsGrid extends StatelessWidget {
  final String favourableDirection;
  final String luckyColour;

  const FavourableTraitsGrid({
    super.key,
    required this.favourableDirection,
    required this.luckyColour,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppStrings.favourableDirection,
                  style: AppTextStyles.satoshi(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    letterSpacing: -0.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                Image.asset(
                  'assets/images/compass.png',
                  width: 150.w,
                  height: 150.h,
                  fit: BoxFit.contain,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/divider_left.png',
                      width: 28.w,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      favourableDirection,
                      style: AppTextStyles.satoshi(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.traitTeal,
                        letterSpacing: -0.2,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Image.asset(
                      'assets/images/divider_right.png',
                      width: 28.w,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppStrings.luckyColour,
                  style: AppTextStyles.satoshi(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    letterSpacing: -0.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                Image.asset(
                  'assets/images/lucky_clover.png',
                  width: 150.w,
                  height: 150.h,
                  fit: BoxFit.contain,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/divider_left.png',
                      width: 28.w,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      luckyColour,
                      style: AppTextStyles.satoshi(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.traitTeal,
                        letterSpacing: -0.2,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Image.asset(
                      'assets/images/divider_right.png',
                      width: 28.w,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
