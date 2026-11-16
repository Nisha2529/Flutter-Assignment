import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../constants/app_text_styles.dart';

class JournalPreviewCardWidget extends StatefulWidget {
  final VoidCallback? onTap;
  final bool showHeaderLabel;

  const JournalPreviewCardWidget({
    super.key,
    this.onTap,
    this.showHeaderLabel = true,
  });

  @override
  State<JournalPreviewCardWidget> createState() =>
      _JournalPreviewCardWidgetState();
}

class _JournalPreviewCardWidgetState extends State<JournalPreviewCardWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  bool _isOpen = false;

  static const double _bookAspectRatio = 1452.0 / 1672.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleBook() {
    if (_isOpen) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() {
      _isOpen = !_isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bookCard = GestureDetector(
      onTap: _toggleBook,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final progress = _animation.value;
          final angle = progress * (pi * 0.95);

          return AspectRatio(
            aspectRatio: _bookAspectRatio,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Opacity(
                  opacity: (progress * 1.6).clamp(0.0, 1.0),
                  child: Transform.scale(
                    scale: 0.94 + 0.06 * progress,
                    child: _RealOpenBookSpread(
                      onClose: _toggleBook,
                      onOpenFull: widget.onTap,
                    ),
                  ),
                ),
                if (progress < 0.98)
                  Transform(
                    alignment: Alignment.centerLeft,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.0016)
                      ..rotateY(-angle),
                    child: Opacity(
                      opacity: (1.0 - progress * 1.3).clamp(0.0, 1.0),
                      child: _buildClosedBookCover(),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );

    if (!widget.showHeaderLabel) {
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

  Widget _buildClosedBookCover() {
    return Container(
      width: double.infinity,
      height: double.infinity,
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
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/book.png',
            width: double.infinity,
            height: double.infinity,
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
    );
  }
}

class _RealOpenBookSpread extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback? onOpenFull;

  const _RealOpenBookSpread({
    required this.onClose,
    this.onOpenFull,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF2C221E),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.28),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: EdgeInsets.all(5.w),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      bottomLeft: Radius.circular(12.r),
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFFFFFDF8),
                        Color(0xFFFAF4E5),
                        Color(0xFFE9DFCA),
                      ],
                      stops: [0.0, 0.85, 1.0],
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(14.w, 16.h, 12.w, 14.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '15 AUG',
                            style: AppTextStyles.satoshi(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF659BA5),
                              letterSpacing: 0.5,
                            ),
                          ),
                          Text(
                            '✦ ♊ ✦',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: const Color(0xFFDFD4AA),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Gratitude',
                        style: AppTextStyles.satoshi(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF191813),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      _buildRuledLine('• Peaceful morning silence'),
                      _buildRuledLine('• Grounded in intention'),
                      _buildRuledLine('• Trusting cosmic timing'),
                      _buildRuledLine('• Celebrating milestones'),
                      _buildRuledLine('• Clear creative energy'),
                      _buildRuledLine('• Stillness and clarity'),
                      const Spacer(),
                      Text(
                        'pg. 1',
                        style: TextStyle(
                          fontSize: 9.sp,
                          color: const Color(0xFF191813).withValues(alpha: 0.4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12.r),
                      bottomRight: Radius.circular(12.r),
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFFE9DFCA),
                        Color(0xFFFAF4E5),
                        Color(0xFFFFFDF8),
                      ],
                      stops: [0.0, 0.15, 1.0],
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(12.w, 16.h, 14.w, 14.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'REFLECTIONS',
                            style: AppTextStyles.satoshi(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF659BA5),
                              letterSpacing: 0.5,
                            ),
                          ),
                          GestureDetector(
                            onTap: onClose,
                            child: Icon(
                              Icons.close_rounded,
                              size: 14.sp,
                              color: const Color(0xFF191813).withValues(alpha: 0.5),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Daily Wisdom',
                        style: AppTextStyles.satoshi(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF191813),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      _buildRuledLine('“The stars align with'),
                      _buildRuledLine(' quiet clarity today.'),
                      _buildRuledLine(' Breathe and let cosmic'),
                      _buildRuledLine(' guidance shape your path.'),
                      _buildRuledLine(' Every day brings clarity'),
                      _buildRuledLine(' and fresh purpose.”'),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'pg. 2',
                            style: TextStyle(
                              fontSize: 9.sp,
                              color: const Color(0xFF191813).withValues(alpha: 0.4),
                            ),
                          ),
                          if (onOpenFull != null)
                            GestureDetector(
                              onTap: onOpenFull,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF191813),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Open →',
                                      style: AppTextStyles.satoshi(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 14.w,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withValues(alpha: 0.0),
                      Colors.black.withValues(alpha: 0.22),
                      Colors.black.withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 12.w,
                height: 65.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF84BAC4),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(3.r),
                    bottomRight: Radius.circular(3.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 4,
                      offset: const Offset(1, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRuledLine(String text) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 4.5.h),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE4DAC3),
            width: 0.8,
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Satoshi',
          fontSize: 11.sp,
          fontStyle: FontStyle.italic,
          color: const Color(0xFF191813).withValues(alpha: 0.82),
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
