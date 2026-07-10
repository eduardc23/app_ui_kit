import 'package:flutter/material.dart';

import '../../../../app_ui_kit.dart';

/// Define las categorías tipográficas disponibles en el sistema de diseño.
///
/// Cada variante mapea directamente a un token de [AppTypography] siguiendo
/// la escala de Material Design 3.
enum AppTextVariant {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall;

  /// Retorna el [TextStyle] correspondiente a la variante.
  TextStyle get textStyle => switch (this) {
    displayLarge => AppTypography.displayLarge,
    displayMedium => AppTypography.displayMedium,
    displaySmall => AppTypography.displaySmall,
    headlineLarge => AppTypography.headlineLarge,
    headlineMedium => AppTypography.headlineMedium,
    headlineSmall => AppTypography.headlineSmall,
    titleLarge => AppTypography.titleLarge,
    titleMedium => AppTypography.titleMedium,
    titleSmall => AppTypography.titleSmall,
    bodyLarge => AppTypography.bodyLarge,
    bodyMedium => AppTypography.bodyMedium,
    bodySmall => AppTypography.bodySmall,
    labelLarge => AppTypography.labelLarge,
    labelMedium => AppTypography.labelMedium,
    labelSmall => AppTypography.labelSmall,
  };
}
