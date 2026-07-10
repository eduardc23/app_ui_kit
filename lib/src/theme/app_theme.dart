import 'package:flutter/material.dart';

import 'color_scheme/app_color_scheme.dart';
import 'components/app_appbar_theme.dart';
import 'components/app_button_theme.dart';
import 'components/app_card_theme.dart';
import 'components/app_chip_theme.dart';
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
    scaffoldBackgroundColor: AppColorScheme.light.surface,
    appBarTheme: AppAppBarTheme.light,
    cardTheme: AppCardTheme.light,
    filledButtonTheme: AppButtonTheme.primary(Brightness.light),
    outlinedButtonTheme: AppButtonTheme.secondary(Brightness.light),
    inputDecorationTheme: AppTextFieldTheme.light,
    chipTheme: AppChipTheme.light,
    sliderTheme: AppRangeSliderTheme.light,
  );

  /// [ThemeData] para modo oscuro.
  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: AppColorScheme.dark,
    textTheme: AppTextTheme.dark,
    scaffoldBackgroundColor: AppColorScheme.dark.surface,
    appBarTheme: AppAppBarTheme.dark,
    cardTheme: AppCardTheme.dark,
    filledButtonTheme: AppButtonTheme.primary(Brightness.dark),
    outlinedButtonTheme: AppButtonTheme.secondary(Brightness.dark),
    inputDecorationTheme: AppTextFieldTheme.dark,
    chipTheme: AppChipTheme.dark,
    sliderTheme: AppRangeSliderTheme.dark,
  );
}
