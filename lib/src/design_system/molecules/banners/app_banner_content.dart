import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import '../../../theme/components/app_feedback_banner/app_feedback_style.dart';

class AppBannerContent extends StatelessWidget {
  const AppBannerContent(
      {super.key, required this.type, required this.message});

  final AppFeedbackType type;
  final String message;

  @override
  Widget build(BuildContext context) {
    final style = AppFeedbackStyle.of(context, type);

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: style.backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(AppRadius.md)),
          border: Border.all(color: style.borderColor),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppIcon(style.icon, size: AppIconSize.sm, color: style.foregroundColor),
            AppSpacing.xs.hGap,
            Expanded(
              child: AppText(
                message,
                variant: AppTextVariant.bodySmall,
                color: style.foregroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
