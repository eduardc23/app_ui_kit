import 'package:flutter/material.dart';

import '../../design_system/tokens/tokens.dart';
import '../color_scheme/app_color_scheme.dart';

abstract final class AppTextButtonTheme {
  static TextButtonThemeData get light => _build(Brightness.light);

  static TextButtonThemeData get dark => _build(Brightness.dark);

  static TextButtonThemeData _build(Brightness brightness) {
    final colorScheme = brightness == Brightness.light
        ? AppColorScheme.light
        : AppColorScheme.dark;

    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: colorScheme.primary,
        //disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        minimumSize: const Size(64, 44),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: AppTypography.labelLarge,
      ),
    );
  }
}
