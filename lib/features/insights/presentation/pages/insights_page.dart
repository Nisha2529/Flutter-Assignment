import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/asset_background.dart';
import '../../../../core/entities/numerology_data.dart';
import '../../../../core/widgets/numerology_card_widget.dart';
import '../bloc/insights_cubit.dart';
import '../widgets/astrological_hero_card.dart';
import '../widgets/astrology_section_widget.dart';
import '../widgets/destiny_number_card.dart';
import '../widgets/favourable_traits_grid.dart';
import '../widgets/fun_facts_card.dart';
import '../widgets/insights_period_selector.dart';

class InsightsPage extends StatefulWidget {
  const InsightsPage({super.key});

  @override
  State<InsightsPage> createState() => _InsightsPageState();
}

class _InsightsPageState extends State<InsightsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    context.read<InsightsCubit>().loadInsights();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AssetBackground(
      assetCandidates: const ['assets/images/Insights_bg.png'],
      fallbackDecoration: const BoxDecoration(color: AppColors.creamBg),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          toolbarHeight: 60.h,
          titleSpacing: 20.w,
          automaticallyImplyLeading: false,
          title: Text(
            AppStrings.insights,
            style: AppTextStyles.satoshi(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              letterSpacing: -0.4,
            ),
          ),
        ),
        body: SafeArea(
          bottom: false,
          child: BlocBuilder<InsightsCubit, InsightsState>(
            builder: (context, state) {
              if (state is InsightsLoading || state is InsightsInitial) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                );
              }

              if (state is InsightsError) {
                return Center(child: Text('Error: ${state.message}'));
              }

              final loaded = state as InsightsLoaded;
              final data = loaded.data;

              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.h),

                      InsightsPeriodSelector(
                        activePeriod: loaded.activePeriod,
                        onPeriodSelected: (period) {
                          context.read<InsightsCubit>().selectPeriod(period);
                        },
                      ),
                      SizedBox(height: 10.h),
                      AstrologicalHeroCard(profile: data.profile),
                      SizedBox(height: 20.h),
                      AstrologySectionWidget(
                        focusOfTheDay: data.focusOfTheDay,
                        horoscopeText: data.horoscopeText,
                      ),
                      SizedBox(height: 18.h),
                      FavourableTraitsGrid(
                        favourableDirection: data.favourableDirection,
                        luckyColour: data.luckyColour,
                      ),
                      SizedBox(height: 20.h),
                      FunFactsCard(text: data.funFacts),
                      Text(
                        AppStrings.numerology,
                        style: AppTextStyles.satoshi(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      SizedBox(height: AppSpacing.sm),
                      NumerologyCardWidget(
                        showHeader: false,
                        numerology: NumerologyData(
                          luckyNumber: data.luckyNumber,
                          guidance: data.numerologyGuidance,
                        ),
                      ),
                      SizedBox(height: AppSpacing.md),
                      DestinyNumberCard(
                        destinyNumber: data.destinyNumber,
                        destinyTitle: data.destinyTitle,
                      ),

                      SizedBox(height: 100.h),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
