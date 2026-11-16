import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../domain/entities/home_data.dart';

class HoroscopeCardWidget extends StatelessWidget {
  final HoroscopeData horoscope;
  final VoidCallback? onReadMore;

  const HoroscopeCardWidget({
    super.key,
    required this.horoscope,
    this.onReadMore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.todaysHoroscope,
          style: AppTextStyles.satoshi(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.sectionHeaderGray,
          ),
        ),
        SizedBox(height: 12.h),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.tealDeep.withValues(alpha: 0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/horoscope.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(18.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            horoscope.sign,
                            style: AppTextStyles.satoshi(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.surface,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            horoscope.date,
                            style: AppTextStyles.satoshi(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.surface.withValues(alpha: 0.40),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            horoscope.advice,
                            style: AppTextStyles.satoshi(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.surface,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: onReadMore,
                              child: Text(
                                AppStrings.readMore,
                                style: AppTextStyles.satoshi(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.dialMint2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -30.h,
              right: 40.w,
              child: Image.asset(
                'assets/images/sign.png',
                width: 80.w,
                height: 80.h,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
