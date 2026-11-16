import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../domain/entities/journal_entry.dart';

class JournalEntryCard extends StatelessWidget {
  final JournalEntry entry;
  final VoidCallback? onTap;

  const JournalEntryCard({super.key, required this.entry, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: AppColors.journalCardBorder, width: 1.2),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.surface, AppColors.journalCardGradientEnd],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.journalDayNumber.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 52.w,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${entry.day}',
                    style: AppTextStyles.satoshi(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.journalDayNumber,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    entry.month,
                    style: AppTextStyles.satoshi(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    entry.weekday,
                    style: AppTextStyles.satoshi(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.journalWeekday,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 74.h,
              width: 1.0,
              color: AppColors.journalDivider,
              margin: EdgeInsets.only(left: 14.w, right: 16.w),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              entry.title,
                              style: AppTextStyles.satoshi(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              entry.content,
                              style: AppTextStyles.satoshi(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.journalSnippet,
                                height: 1.35,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: AppColors.textPrimary,
                        size: 26.sp,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),

                  Text(
                    entry.time,
                    style: AppTextStyles.satoshi(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.journalSnippet,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
