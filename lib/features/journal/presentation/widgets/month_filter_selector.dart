import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';

class MonthFilterSelector extends StatelessWidget {
  final List<String> months;
  final String selectedMonth;
  final ValueChanged<String> onMonthSelected;

  const MonthFilterSelector({
    super.key,
    this.months = const [
      AppStrings.monthAug,
      AppStrings.monthSep,
      AppStrings.monthOct,
      AppStrings.monthNov,
      AppStrings.monthDec,
    ],
    required this.selectedMonth,
    required this.onMonthSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: months.map((month) {
          final isSelected = month.toLowerCase() == selectedMonth.toLowerCase();
          return GestureDetector(
            onTap: () => onMonthSelected(month),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.bookBannerText
                    : AppColors.monthUnselectedBg,
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(
                  color: isSelected
                      ? AppColors.bookBannerText
                      : AppColors.monthUnselectedBorder,
                  width: 1.0,
                ),
              ),
              child: Text(
                month,
                style: AppTextStyles.satoshi(
                  fontSize: 14.sp,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected ? AppColors.surface : AppColors.textPrimary,
                  letterSpacing: -0.2,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
