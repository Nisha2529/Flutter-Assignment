import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';

class GoalsPage extends StatelessWidget {
  const GoalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          AppStrings.navGoals,
          style: AppTextStyles.satoshi(
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.surface,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(
                  'assets/images/goals.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                AppStrings.yourJourneyStartsHere,
                style: AppTextStyles.satoshi(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.surface,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                AppStrings.goalsDescription,
                style: AppTextStyles.satoshi(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.homeTraitsText,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
