import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../domain/entities/insights_data.dart';

class AstrologicalHeroCard extends StatelessWidget {
  final AstrologicalProfile profile;

  const AstrologicalHeroCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          profile.userName,
          style: AppTextStyles.satoshi(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
            letterSpacing: -0.3,
          ),
        ),
        SizedBox(height: 3.h),
        Text(
          profile.birthInfo,
          style: AppTextStyles.satoshi(
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: 4.h),
        LayoutBuilder(
          builder: (context, constraints) {
            final size = constraints.maxWidth < 330.0
                ? constraints.maxWidth
                : 330.0;
            final scale = size / 330.0;

            return SizedBox(
              width: size,
              height: size,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/signing.png',
                    height: size,
                    width: size,
                    fit: BoxFit.contain,
                  ),
                  Positioned(
                    top: 40 * scale,
                    left: 1,
                    child: Transform.scale(
                      scale: scale < 1.0 ? scale : 1.0,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/cancer.svg',
                            width: 26.w,
                            height: 26.h,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: 8.w),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.cancer,
                                style: AppTextStyles.satoshi(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary,
                                  height: 1.15,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                AppStrings.sunSign,
                                style: AppTextStyles.satoshi(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40 * scale,
                    right: 1,
                    child: Transform.scale(
                      scale: scale < 1.0 ? scale : 1.0,
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                AppStrings.leo,
                                style: AppTextStyles.satoshi(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary,
                                  height: 1.15,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                AppStrings.moonSign,
                                style: AppTextStyles.satoshi(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 8.w),
                          SvgPicture.asset(
                            'assets/icons/leo.svg',
                            width: 26.w,
                            height: 26.h,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8 * scale,
                    child: Text(
                      AppStrings.leo,
                      style: AppTextStyles.satoshi(
                        fontSize: 17.sp * scale,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        SizedBox(height: 14.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('assets/icons/stardivider.png', height: 20.h)],
        ),
      ],
    );
  }
}
