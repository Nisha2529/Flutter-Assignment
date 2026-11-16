import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/asset_background.dart';

import '../../../../core/widgets/journal_preview_card_widget.dart';

import '../bloc/journal_cubit.dart';
import '../widgets/add_entry_dialog.dart';
import '../widgets/journal_entry_card.dart';
import '../widgets/month_filter_selector.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    context.read<JournalCubit>().loadEntries();
  }

  void _showAddEntryModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return AddEntryDialog(
          onAdd: (title, content) {
            this.context.read<JournalCubit>().addNewEntry(
              title: title,
              content: content,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AssetBackground(
      assetCandidates: const ['assets/images/journal_bg.png'],
      fallbackDecoration: const BoxDecoration(color: AppColors.creamBg),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          toolbarHeight: 68.h,
          titleSpacing: 20.w,
          automaticallyImplyLeading: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.yourJournal,
                style: AppTextStyles.satoshi(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                AppStrings.aSpaceToBeYou,
                style: AppTextStyles.satoshi(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          bottom: false,
          child: BlocBuilder<JournalCubit, JournalState>(
            builder: (context, state) {
              if (state is JournalLoading || state is JournalInitial) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                );
              }

              if (state is JournalError) {
                return Center(child: Text('Error: ${state.message}'));
              }

              final loaded = state as JournalLoaded;

              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 12.h),

                      const JournalPreviewCardWidget(showHeaderLabel: false),
                      SizedBox(height: 24.h),

                      MonthFilterSelector(
                        selectedMonth: loaded.selectedMonth,
                        onMonthSelected: (month) {
                          context.read<JournalCubit>().selectMonth(month);
                        },
                      ),
                      SizedBox(height: 17.h),
                      Image.asset('assets/icons/divider.png', height: 20.h),
                      SizedBox(height: 24.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              AppStrings.recentEntries,
                              style: AppTextStyles.satoshi(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          GestureDetector(
                            onTap: _showAddEntryModal,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 28.sp,
                                  color: AppColors.addEntryTeal,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  AppStrings.addEntry,
                                  style: AppTextStyles.satoshi(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.addEntryTeal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      if (loaded.entries.isEmpty)
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 36.h),
                          child: Center(
                            child: Text(
                              'No entries for ${loaded.selectedMonth}',
                              style: AppTextStyles.satoshi(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                        )
                      else
                        ListView.builder(
                          itemCount: loaded.entries.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final entry = loaded.entries[index];
                            return TweenAnimationBuilder<double>(
                              key: ValueKey(entry.id),
                              tween: Tween(begin: 0.0, end: 1.0),
                              duration: Duration(
                                milliseconds: 250 + (index * 60),
                              ),
                              curve: Curves.easeOut,
                              builder: (context, value, child) {
                                return Opacity(
                                  opacity: value,
                                  child: Transform.translate(
                                    offset: Offset(0, (1 - value) * 12),
                                    child: child,
                                  ),
                                );
                              },
                              child: JournalEntryCard(entry: entry),
                            );
                          },
                        ),

                      SizedBox(height: 50.h),
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
