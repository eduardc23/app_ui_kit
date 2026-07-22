import 'package:flutter/material.dart';

import '../../../design_system/molecules/banners/app_feedback_banner.dart';
import 'app_feedback_banner_theme.dart';

class AppFeedbackStyle {
  const AppFeedbackStyle._({
    required this.backgroundColor,
    required this.borderColor,
    required this.foregroundColor,
    required this.icon,
  });

  final Color backgroundColor;
  final Color borderColor;
  final Color foregroundColor;
  final IconData icon;

  factory AppFeedbackStyle.of(BuildContext context, AppFeedbackType type) {
    final theme = Theme.of(context).extension<AppFeedbackBannerTheme>()!;

    return switch (type) {
      AppFeedbackType.error => AppFeedbackStyle._(
          backgroundColor: theme.errorBackground,
          borderColor: theme.errorBorder,
          foregroundColor: theme.errorForeground,
          icon: Icons.error_outline_rounded,
        ),
      AppFeedbackType.success => AppFeedbackStyle._(
          backgroundColor: theme.successBackground,
          borderColor: theme.successBorder,
          foregroundColor: theme.successForeground,
          icon: Icons.check_circle_outline_rounded,
        ),
      AppFeedbackType.warning => AppFeedbackStyle._(
          backgroundColor: theme.warningBackground,
          borderColor: theme.warningBorder,
          foregroundColor: theme.warningForeground,
          icon: Icons.warning_amber_rounded,
        ),
      AppFeedbackType.info => AppFeedbackStyle._(
          backgroundColor: theme.infoBackground,
          borderColor: theme.infoBorder,
          foregroundColor: theme.infoForeground,
          icon: Icons.info_outline_rounded,
        ),
    };
  }
}
