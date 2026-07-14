import 'package:flutter/material.dart';

import '../../design_system/tokens/app_colors.dart';

/// Fábrica de [ColorScheme] que asigna roles semánticos (primary, secondary…)
/// a los primitivos definidos en [AppColors].
///
/// ### Responsabilidad
/// Este archivo responde a la pregunta "¿para qué sirve este color?",
/// mientras que [AppColors] responde a "¿qué color es?".
abstract final class AppColorScheme {
  /// Retorna el [ColorScheme] para modo claro.
  static const ColorScheme light = ColorScheme(
    brightness: Brightness.light,
    // ── Primary ──
    primary: AppColors.blue400,
    surfaceTint: AppColors.blue400,
    onPrimary: AppColors.white,
    primaryContainer: AppColors.blue100,
    onPrimaryContainer: AppColors.blue600,
    // ── Secondary (blanco) ──
    secondary: AppColors.white,
    onSecondary: AppColors.black,
    secondaryContainer: AppColors.white,
    onSecondaryContainer: AppColors.gray100,
    // ── Tertiary (azul pastel) ──
    tertiary: AppColors.powder100,
    onTertiary: AppColors.black,
    tertiaryContainer: AppColors.white,
    onTertiaryContainer: AppColors.powder300,
    // ── Error ──
    error: AppColors.red600,
    onError: AppColors.white,
    errorContainer: AppColors.red100,
    onErrorContainer: AppColors.red900,
    // ── Surface ──
    surface: AppColors.neutral50,
    onSurface: AppColors.neutral900,
    onSurfaceVariant: AppColors.neutral800,
    // ── Outline ──
    outline: AppColors.neutral700,
    outlineVariant: AppColors.neutral500,
    // ── Utility ──
    shadow: AppColors.black,
    scrim: AppColors.black,
    inverseSurface: AppColors.neutral850,
    onInverseSurface: AppColors.neutral150,
    inversePrimary: AppColors.blue500,
    // ── Fixed tokens ──
    primaryFixed: AppColors.blue100,
    onPrimaryFixed: AppColors.blue700,
    primaryFixedDim: AppColors.blue200,
    onPrimaryFixedVariant: AppColors.blue500,
    secondaryFixed: AppColors.white,
    onSecondaryFixed: AppColors.gray200,
    secondaryFixedDim: AppColors.white,
    onSecondaryFixedVariant: AppColors.gray50,
    tertiaryFixed: AppColors.white,
    onTertiaryFixed: AppColors.powder400,
    tertiaryFixedDim: AppColors.powder50,
    onTertiaryFixedVariant: AppColors.powder200,
    // ── Surface containers ──
    surfaceDim: AppColors.neutral400,
    surfaceBright: AppColors.neutral50,
    surfaceContainerLowest: AppColors.white,
    surfaceContainerLow: AppColors.neutral100,
    surfaceContainer: AppColors.neutral200,
    surfaceContainerHigh: AppColors.neutral300,
    surfaceContainerHighest: AppColors.neutral400,
  );

  /// Retorna el [ColorScheme] para modo oscuro.
  static const ColorScheme dark = ColorScheme(
    brightness: Brightness.dark,
    // ── Primary ──
    primary: AppColors.blue500,
    surfaceTint: AppColors.blue500,
    onPrimary: AppColors.white,
    primaryContainer: AppColors.blue700,
    onPrimaryContainer: AppColors.white,
    // ── Secondary (gris claro) ──
    secondary: AppColors.gray50,
    onSecondary: AppColors.black,
    secondaryContainer: AppColors.gray200,
    onSecondaryContainer: AppColors.black,
    // ── Tertiary (azul pastel más oscuro) ──
    tertiary: AppColors.powder200,
    onTertiary: AppColors.black,
    tertiaryContainer: AppColors.powder400,
    onTertiaryContainer: AppColors.black,
    // ── Error ──
    error: AppColors.red200,
    onError: AppColors.black,
    errorContainer: AppColors.red900,
    onErrorContainer: AppColors.white,
    // ── Surface ──
    surface: AppColors.dark400,
    onSurface: AppColors.neutral400,
    onSurfaceVariant: AppColors.neutral500,
    // ── Outline ──
    outline: AppColors.neutral600,
    outlineVariant: AppColors.neutral800,
    // ── Utility ──
    shadow: AppColors.black,
    scrim: AppColors.black,
    inverseSurface: AppColors.neutral400,
    onInverseSurface: AppColors.neutral850,
    inversePrimary: AppColors.blue400,
    // ── Fixed tokens (spec Material 3: igual en ambos temas) ──
    primaryFixed: AppColors.blue100,
    onPrimaryFixed: AppColors.blue700,
    primaryFixedDim: AppColors.blue200,
    onPrimaryFixedVariant: AppColors.blue500,
    secondaryFixed: AppColors.white,
    onSecondaryFixed: AppColors.gray200,
    secondaryFixedDim: AppColors.white,
    onSecondaryFixedVariant: AppColors.gray50,
    tertiaryFixed: AppColors.white,
    onTertiaryFixed: AppColors.powder400,
    tertiaryFixedDim: AppColors.powder50,
    onTertiaryFixedVariant: AppColors.powder200,
    // ── Surface containers ──
    surfaceDim: AppColors.dark400,
    surfaceBright: AppColors.dark50,
    surfaceContainerLowest: AppColors.dark500,
    surfaceContainerLow: AppColors.dark300,
    surfaceContainer: AppColors.dark200,
    surfaceContainerHigh: AppColors.dark100,
    surfaceContainerHighest: AppColors.dark50,
  );
}
