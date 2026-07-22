import 'package:app_ui_kit/src/theme/components/app_text_button_theme.dart';
import 'package:flutter/material.dart';

import '../../app_ui_kit.dart';
import 'components/app_appbar_theme.dart';
import 'components/app_button_theme.dart';
import 'components/app_card_theme.dart';
import 'components/app_chip_theme.dart';
import 'components/app_feedback_banner/app_feedback_banner_theme.dart';
import 'components/app_navigation_bar_theme.dart';
import 'components/app_range_slider_theme.dart';
import 'components/app_text_field_theme.dart';
import 'components/app_text_theme.dart';

/// Punto de ensamblaje del sistema de diseño.
///
/// Compone los [ThemeData] de modo claro y oscuro a partir de
/// las clases de tema individuales. No define valores — solo ensambla.
abstract final class AppTheme {
  /// [ThemeData] para modo claro.
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: AppColorScheme.light,
        textTheme: AppTextTheme.light,
        appBarTheme: AppAppBarTheme.light,
        cardTheme: AppCardTheme.light,
        filledButtonTheme: AppButtonTheme.primary(Brightness.light),
        outlinedButtonTheme: AppButtonTheme.secondary(Brightness.light),
        inputDecorationTheme: AppTextFieldTheme.light,
        chipTheme: AppChipTheme.light,
        sliderTheme: AppRangeSliderTheme.light,
        navigationBarTheme: AppNavigationBarTheme.light,
        textButtonTheme: AppTextButtonTheme.light,
        extensions: [
          AppFeedbackBannerTheme(
            // ── Error ──
            errorBackground: AppColors.red100,
            errorBorder: AppColors.red200,
            errorForeground: AppColors.red600,

            // ── Success ──
            successBackground: AppColors.green100,
            successBorder: AppColors.green200,
            successForeground: AppColors.green400,

            // ── Warning ──
            warningBackground: AppColors.amber100,
            warningBorder: AppColors.amber200,
            warningForeground: AppColors.amber400,

            // ── Info ──
            infoBackground: AppColors.powder50,
            infoBorder: AppColors.powder100,
            infoForeground: AppColors.powder400,
          ),
        ],
      );

  /// [ThemeData] para modo oscuro.
  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: AppColorScheme.dark,
        textTheme: AppTextTheme.dark,
        appBarTheme: AppAppBarTheme.dark,
        cardTheme: AppCardTheme.dark,
        filledButtonTheme: AppButtonTheme.primary(Brightness.dark),
        outlinedButtonTheme: AppButtonTheme.secondary(Brightness.dark),
        inputDecorationTheme: AppTextFieldTheme.dark,
        chipTheme: AppChipTheme.dark,
        sliderTheme: AppRangeSliderTheme.dark,
        navigationBarTheme: AppNavigationBarTheme.dark,
        textButtonTheme: AppTextButtonTheme.dark,
        extensions: [
          AppFeedbackBannerTheme(
            // ── Error ──
            errorBackground: AppColors.red900,
            errorBorder: AppColors.red600,
            errorForeground: AppColors.red200,

            // ── Success ──
            successBackground: AppColors.green700,
            successBorder: AppColors.green400,
            successForeground: AppColors.green200,

            // ── Warning ──
            warningBackground: AppColors.amber700,
            warningBorder: AppColors.amber400,
            warningForeground: AppColors.amber200,

            // ── Info ──
            infoBackground: AppColors.powder400.withValues(alpha: 0.15),
            infoBorder: AppColors.powder300,
            infoForeground: AppColors.powder100,
          ),
        ],
      );
}
