import 'package:flutter/material.dart';

import '../../design_system/tokens/tokens.dart';
import '../color_scheme/app_color_scheme.dart';

/// Tema global de botones del sistema de diseño.
///
/// Configura los estilos base de cada variante de botón a través de
/// [FilledButtonThemeData] y [OutlinedButtonThemeData].
///
/// ### Variantes y su widget base
/// | Variante    | Widget base     | ThemeData key          |
/// |-------------|-----------------|------------------------|
/// | Primary     | [FilledButton]  | [filledButtonTheme]    |
/// | Secondary   | [OutlinedButton]| [outlinedButtonTheme]  |
abstract final class AppButtonTheme {
  // ─────────────────────────────────────────────
  // Dimensiones internas — tamaño md
  // ─────────────────────────────────────────────

  /// Altura fija del botón en tamaño `md`.
  static const double height = 48;

  /// Padding interno horizontal y vertical del botón.
  static const EdgeInsets padding = EdgeInsets.symmetric(
    horizontal: AppSpacing.xl,
    vertical: AppSpacing.md,
  );

  /// Shape compartido por todas las variantes.
  static RoundedRectangleBorder _shape() =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md));

  /// Tema para la variante [AppButtonVariant.primary].
  static FilledButtonThemeData primary(Brightness brightness) {
    final ColorScheme scheme = brightness == Brightness.light
        ? AppColorScheme.light
        : AppColorScheme.dark;

    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        disabledBackgroundColor: scheme.onSurface.withValues(
          alpha: AppOpacity.disabledSurface,
        ),
        disabledForegroundColor: scheme.onSurface.withValues(
          alpha: AppOpacity.disabled,
        ),
        padding: padding,
        minimumSize: Size(0, height),
        shape: _shape(),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    );
  }

  /// Tema para la variante [AppButtonVariant.secondary].
  static OutlinedButtonThemeData secondary(Brightness brightness) {
    final ColorScheme scheme = brightness == Brightness.light
        ? AppColorScheme.light
        : AppColorScheme.dark;

    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: scheme.primary,
        disabledForegroundColor: scheme.onSurface.withValues(
          alpha: AppOpacity.disabled,
        ),
        disabledBackgroundColor: scheme.onSurface.withValues(
          alpha: AppOpacity.disabledSurface,
        ),
        side: BorderSide(color: scheme.outline, width: AppBorder.widthThin),
        padding: padding,
        minimumSize: Size(0, height),
        shape: _shape(),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
