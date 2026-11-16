import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';

class GoalsCardWidget extends StatelessWidget {
  final VoidCallback? onCreateGoal;

  const GoalsCardWidget({super.key, this.onCreateGoal});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.goals,
          style: AppTextStyles.satoshi(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.sectionHeaderGray,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          width: double.infinity,
          height: 185.h,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGray, width: 1),
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
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
                    'assets/images/goals.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.noGoalsYet,
                            style: AppTextStyles.satoshi(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.goalsTitle,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            AppStrings.letYourIntentionsGuide,
                            style: AppTextStyles.satoshi(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.goalsSubtitle,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: onCreateGoal ?? () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              side: const BorderSide(
                                color: AppColors.surface,
                                width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0.h),
                              child: Text(
                                AppStrings.createYourGoal,
                                style: AppTextStyles.satoshi(
                                  color: AppColors.surface,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
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
      ],
    );
  }
}
