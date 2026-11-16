import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';

class AddEntryDialog extends StatefulWidget {
  final Function(String title, String content) onAdd;

  const AddEntryDialog({super.key, required this.onAdd});

  @override
  State<AddEntryDialog> createState() => _AddEntryDialogState();
}

class _AddEntryDialogState extends State<AddEntryDialog> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: AppSpacing.md,
        right: AppSpacing.md,
        top: AppSpacing.lg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.newJournalEntry,
                style: AppTextStyles.satoshi(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.md),
          TextField(
            controller: _titleController,
            style: AppTextStyles.satoshi(),
            decoration: InputDecoration(
              labelText: AppStrings.titleLabel,
              labelStyle: AppTextStyles.satoshi(),
              hintText: AppStrings.titleHint,
              hintStyle: AppTextStyles.satoshi(color: AppColors.textMuted),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              ),
            ),
          ),
          SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _contentController,
            style: AppTextStyles.satoshi(),
            maxLines: 4,
            decoration: InputDecoration(
              labelText: AppStrings.reflectionLabel,
              labelStyle: AppTextStyles.satoshi(),
              hintText: AppStrings.reflectionHint,
              hintStyle: AppTextStyles.satoshi(color: AppColors.textMuted),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              ),
            ),
          ),
          SizedBox(height: AppSpacing.md),
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonTeal,
                foregroundColor: AppColors.surface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                ),
              ),
              onPressed: () {
                final title = _titleController.text.trim();
                final content = _contentController.text.trim();
                if (title.isNotEmpty && content.isNotEmpty) {
                  widget.onAdd(title, content);
                  Navigator.pop(context);
                }
              },
              child: Text(
                AppStrings.saveEntry,
                style: AppTextStyles.satoshi(
                  fontWeight: FontWeight.w600,
                  color: AppColors.surface,
                ),
              ),
            ),
          ),
          SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}
