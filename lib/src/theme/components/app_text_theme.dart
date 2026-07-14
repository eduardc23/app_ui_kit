import 'package:flutter/material.dart';

import '../../design_system/tokens/app_typography.dart';
import '../color_scheme/app_color_scheme.dart';

/// Tema tipográfico del sistema de diseño.
///
/// Construye el [TextTheme] a partir de los tokens
/// de [AppTypography], aplicando el color de contenido correcto
/// según el modo activo.
abstract final class AppTextTheme {
  /// [TextTheme] para modo claro.
  static TextTheme get light => _build(Brightness.light);

  /// [TextTheme] para modo oscuro.
  static TextTheme get dark => _build(Brightness.dark);

  static TextTheme _build(Brightness brightness) {
    final Color contentColor = brightness == Brightness.light
        ? AppColorScheme.light.onSurface
        : AppColorScheme.dark.onSurface;

    return TextTheme(
      displayLarge: AppTypography.displayLarge,
      displayMedium: AppTypography.displayMedium,
      displaySmall: AppTypography.displaySmall,
      headlineLarge: AppTypography.headlineLarge,
      headlineMedium: AppTypography.headlineMedium,
      headlineSmall: AppTypography.headlineSmall,
      titleLarge: AppTypography.titleLarge,
      titleMedium: AppTypography.titleMedium,
      titleSmall: AppTypography.titleSmall,
      bodyLarge: AppTypography.bodyLarge,
      bodyMedium: AppTypography.bodyMedium,
      bodySmall: AppTypography.bodySmall,
      labelLarge: AppTypography.labelLarge,
      labelMedium: AppTypography.labelMedium,
      labelSmall: AppTypography.labelSmall,
    ).apply(bodyColor: contentColor, displayColor: contentColor);
  }
}
