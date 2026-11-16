import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';

class InsightsPeriodSelector extends StatelessWidget {
  final String activePeriod;
  final ValueChanged<String> onPeriodSelected;

  const InsightsPeriodSelector({
    super.key,
    required this.activePeriod,
    required this.onPeriodSelected,
  });

  static const List<String> _periods = [
    AppStrings.periodYesterday,
    AppStrings.periodToday,
    AppStrings.periodTomorrow,
    AppStrings.periodWeek,
    AppStrings.periodMonth,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: _periods.length,
        separatorBuilder: (_, _) => SizedBox(width: 16.w),
        itemBuilder: (context, index) {
          final period = _periods[index];
          final isSelected = period.toUpperCase() == activePeriod.toUpperCase();

          return GestureDetector(
            onTap: () => onPeriodSelected(period),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  period.toUpperCase(),
                  style: AppTextStyles.satoshi(
                    fontSize: 11.sp,
                    fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
                    color: isSelected
                        ? AppColors.journalCoverTeal
                        : AppColors.textMuted,
                    letterSpacing: 0.6,
                  ),
                ),
                SizedBox(height: 4.h),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 2.h,
                  width: isSelected ? 24.w : 0,
                  decoration: BoxDecoration(
                    color: AppColors.journalCoverTeal,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
