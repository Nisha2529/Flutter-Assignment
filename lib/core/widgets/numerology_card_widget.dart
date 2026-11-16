import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../constants/app_text_styles.dart';
import '../entities/numerology_data.dart';

class NumerologyCardWidget extends StatelessWidget {
  final NumerologyData numerology;
  final bool showHeader;

  const NumerologyCardWidget({
    super.key,
    required this.numerology,
    this.showHeader = true,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/globe.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              left: 16.w,
              right: 16.w,
              bottom: 16.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppStrings.todaysGuidance,
                    style: AppTextStyles.satoshi(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.guidanceTitle,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    numerology.guidance,
                    style: AppTextStyles.satoshi(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.goalsSubtitle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    if (!showHeader) {
      return card;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.todaysNumerology,
          style: AppTextStyles.satoshi(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.sectionHeaderGray,
          ),
        ),
        SizedBox(height: 8.h),
        card,
      ],
    );
  }
}
