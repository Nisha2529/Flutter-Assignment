import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/asset_background.dart';
import '../../../../core/widgets/journal_preview_card_widget.dart';
import '../../../../core/widgets/numerology_card_widget.dart';
import '../../../../core/widgets/responsive_layout.dart';
import '../../../navigation/cubit/navigation_cubit.dart';
import '../bloc/home_cubit.dart';
import '../widgets/goals_card_widget.dart';
import '../widgets/horoscope_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().loadHomeData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final topPadding = MediaQuery.of(context).padding.top;
    const toolbarHeight = 78.0;
    // On mobile (< 600px), match existing layout precisely using screen width up to 430px.
    // On tablet and desktop (>= 600px), cap effective width to 430px so content is not pushed down.
    final effectiveWidth = ResponsiveLayout.isMobile(context)
        ? screenWidth.clamp(0.0, 430.0)
        : 430.0;
    final dialBottomY = effectiveWidth * 1.014;
    final dialSpacing = (dialBottomY - (topPadding + toolbarHeight)).clamp(
      0.0,
      300.0,
    );

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading || state is HomeInitial) {
          return const Scaffold(
            backgroundColor: AppColors.scaffoldDark,
            body: Center(
              child: CircularProgressIndicator(color: AppColors.accentCyan),
            ),
          );
        }

        if (state is HomeError) {
          return Scaffold(
            backgroundColor: AppColors.scaffoldDark,
            body: Center(
              child: Text(
                'Error: ${state.message}',
                style: AppTextStyles.satoshi(color: AppColors.surface),
              ),
            ),
          );
        }

        final data = (state as HomeLoaded).data;

        return AssetBackground(
          assetCandidates: const ['assets/images/home_bg.png'],
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
          fallbackDecoration: const BoxDecoration(
            color: AppColors.scaffoldDark,
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              scrolledUnderElevation: 0,
              toolbarHeight: toolbarHeight,
              titleSpacing: 16,
              automaticallyImplyLeading: false,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppStrings.goodEvening,
                    style: AppTextStyles.satoshi(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.creamLight,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    data.profile.name,
                    style: AppTextStyles.satoshi(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.backgroundGray,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    data.profile.traits,
                    style: AppTextStyles.satoshi(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.homeTraitsText,
                    ),
                  ),
                ],
              ),
              actions: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(AppStrings.profileTapped),
                            duration: Duration(milliseconds: 800),
                          ),
                        );
                      },
                      child: SvgPicture.asset(
                        'assets/icons/user.svg',
                        width: 40.w,
                        height: 40.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(AppStrings.notificationsTapped),
                            duration: Duration(milliseconds: 800),
                          ),
                        );
                      },
                      child: SvgPicture.asset(
                        'assets/icons/notification.svg',
                        width: 40.w,
                        height: 40.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16.w),
              ],
            ),
            body: SafeArea(
              bottom: false,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: dialSpacing),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(28.r),
                        ),
                      ),
                      padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 120.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GoalsCardWidget(
                            onCreateGoal: () {
                              context.read<NavigationCubit>().setTab(1);
                            },
                          ),
                          SizedBox(height: 24.h),

                          HoroscopeCardWidget(
                            horoscope: data.horoscope,
                            onReadMore: () {
                              context.read<NavigationCubit>().setTab(3);
                            },
                          ),
                          SizedBox(height: 24.h),

                          NumerologyCardWidget(numerology: data.numerology),
                          SizedBox(height: 24.h),

                          JournalPreviewCardWidget(
                            onTap: () {
                              context.read<NavigationCubit>().setTab(2);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
