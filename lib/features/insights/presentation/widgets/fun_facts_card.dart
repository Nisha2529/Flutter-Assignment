import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';

class FunFactsCard extends StatelessWidget {
  final String text;

  const FunFactsCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 170.h),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/funfact.png', fit: BoxFit.fill),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 22.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.funFacts,
                  style: AppTextStyles.satoshi(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.surface,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  text,
                  style: AppTextStyles.satoshi(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.funFactsText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
