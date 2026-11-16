import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';

class AstrologySectionWidget extends StatelessWidget {
  final String focusOfTheDay;
  final String horoscopeText;

  const AstrologySectionWidget({
    super.key,
    required this.focusOfTheDay,
    required this.horoscopeText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.astrology,
          style: AppTextStyles.satoshi(
            fontSize: 13.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.textSecondary,
            letterSpacing: 1.1,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          width: double.infinity,
          height: 68.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: AppColors.focusCardBorder.withValues(alpha: 0.8),
              width: 1.0,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/focus_day_bg.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${AppStrings.focusOfTheDayPrefix}: ',
                              style: AppTextStyles.satoshi(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textSecondary,
                                letterSpacing: -0.2,
                              ),
                            ),
                            TextSpan(
                              text: focusOfTheDay,
                              style: AppTextStyles.satoshi(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.focusDayTeal,
                                letterSpacing: -0.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 14.h),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: AppColors.horoscopeInsightsBorder,
              width: 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/horoscope_insights_bg.png',
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomRight,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(18.w, 18.h, 18.w, 22.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.yourTodaysHoroscope,
                        style: AppTextStyles.satoshi(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                          letterSpacing: -0.2,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        horoscopeText,
                        style: AppTextStyles.satoshi(
                          fontSize: 13.5.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.horoscopeTextDark,
                          height: 1.45,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
