import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border, width: 0.8)),
      ),
      padding: EdgeInsets.only(bottom: bottomPadding > 0 ? bottomPadding : 6),
      child: Row(
        children: [
          _buildNavItem(
            index: 0,
            label: AppStrings.navHome,
            selectedIcon: 'assets/icons/navbar/SDhome.svg',
            unselectedIcon: 'assets/icons/navbar/UNShome.svg',
          ),
          _buildNavItem(
            index: 1,
            label: AppStrings.navGoals,
            selectedIcon: 'assets/icons/navbar/UNSgoal.svg',
            unselectedIcon: 'assets/icons/navbar/UNSgoal.svg',
            isGoal: true,
          ),
          _buildNavItem(
            index: 2,
            label: AppStrings.navJournal,
            selectedIcon: 'assets/icons/navbar/SDjournal.svg',
            unselectedIcon: 'assets/icons/navbar/UNSjournal.svg',
          ),
          _buildNavItem(
            index: 3,
            label: AppStrings.navInsights,
            selectedIcon: 'assets/icons/navbar/SDInsights.svg',
            unselectedIcon: 'assets/icons/navbar/UNSInsights.svg',
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String label,
    required String selectedIcon,
    required String unselectedIcon,
    bool isGoal = false,
  }) {
    final isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onItemSelected(index),
        behavior: HitTestBehavior.opaque,
        child: SizedBox(
          height: 60.h.clamp(56.0, 72.0),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              if (isSelected)
                Positioned(
                  top: 0,
                  child: Image.asset(
                    'assets/icons/navbar/Select.png',
                    width: 72.w,
                    height: 32.h,
                    fit: BoxFit.fill,
                  ),
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 4.h),
                  SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: SvgPicture.asset(
                      isSelected ? selectedIcon : unselectedIcon,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    label,
                    style: AppTextStyles.satoshi(
                      fontSize: 12.sp,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                      color: isSelected
                          ? AppColors.navSelected
                          : AppColors.navUnselected,
                      letterSpacing: -0.2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
