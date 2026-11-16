import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../constants/app_text_styles.dart';

class JournalPreviewCardWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final bool showHeaderLabel;

  const JournalPreviewCardWidget({
    super.key,
    this.onTap,
    this.showHeaderLabel = true,
  });

  @override
  Widget build(BuildContext context) {
    final bookCard = GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/book.png',
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            Positioned(
              top: 40.h,
              left: 45.w,
              right: 20.w,
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    AppStrings.saniyasJournal,
                    style: AppTextStyles.satoshi(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w800,
                      color: AppColors.bookBannerText,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    if (!showHeaderLabel) {
      return bookCard;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.yourJournalHeader,
          style: AppTextStyles.satoshi(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.sectionHeaderGray,
          ),
        ),
        SizedBox(height: 8.h),
        bookCard,
      ],
    );
  }
}

