import 'package:flutter/material.dart';

import '../../../../app_ui_kit.dart';

/// Tema global de campos de texto del sistema de diseño.
///
/// Configura el estilo de los campos de texto para que sigan el estilo
/// contorneado Outlined por defecto.
abstract final class AppTextFieldTheme {
  /// [InputDecorationTheme] para modo claro.
  static InputDecorationTheme get light =>
      _buildTheme(colorScheme: AppColorScheme.light);

  /// [InputDecorationTheme] para modo oscuro.
  static InputDecorationTheme get dark =>
      _buildTheme(colorScheme: AppColorScheme.dark);

  static const int _maxSupportingTextLines = 2;

  static InputDecorationTheme _buildTheme({required ColorScheme colorScheme}) {
    const borderRadius = BorderRadius.all(Radius.circular(AppRadius.md));
    const focusedBorderWidth = AppBorder.widthMedium;

    return InputDecorationTheme(
      // Padding interno
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),

      // Etiqueta flotante
      labelStyle: WidgetStateTextStyle.resolveWith((states) {
        final color = switch (states) {
          _ when states.contains(WidgetState.disabled) =>
            colorScheme.onSurface.withValues(alpha: AppOpacity.disabled),
          _ when states.contains(WidgetState.error) => colorScheme.error,
          _ when states.contains(WidgetState.focused) => colorScheme.primary,
          _ => colorScheme.onSurfaceVariant,
        };
        return TextStyle(color: color);
      }),
      floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
        final color = switch (states) {
          _ when states.contains(WidgetState.disabled) =>
            colorScheme.onSurface.withValues(alpha: AppOpacity.disabled),
          _ when states.contains(WidgetState.error) => colorScheme.error,
          _ when states.contains(WidgetState.focused) => colorScheme.primary,
          _ => colorScheme.onSurfaceVariant,
        };
        return TextStyle(color: color);
      }),
      floatingLabelBehavior: FloatingLabelBehavior.auto,

      // Hint / Helper / Error
      hintStyle: TextStyle(
        color: colorScheme.onSurfaceVariant.withValues(alpha: AppOpacity.hint),
      ),
      helperStyle: TextStyle(color: colorScheme.onSurfaceVariant),
      errorStyle: TextStyle(color: colorScheme.error),
      errorMaxLines: _maxSupportingTextLines,
      helperMaxLines: _maxSupportingTextLines,

      // Iconos
      prefixIconColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return colorScheme.onSurface.withValues(alpha: AppOpacity.disabled);
        }
        if (states.contains(WidgetState.error)) return colorScheme.error;
        if (states.contains(WidgetState.focused)) return colorScheme.primary;
        return colorScheme.onSurfaceVariant;
      }),
      suffixIconColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return colorScheme.onSurface.withValues(alpha: AppOpacity.disabled);
        }
        if (states.contains(WidgetState.error)) return colorScheme.error;
        return colorScheme.onSurfaceVariant;
      }),

      // Bordes (outlined)
      border: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: colorScheme.outline),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: colorScheme.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: colorScheme.primary,
          width: focusedBorderWidth,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: colorScheme.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: colorScheme.error,
          width: focusedBorderWidth,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: colorScheme.onSurface.withValues(
            alpha: AppOpacity.disabledSurface,
          ),
        ),
      ),

      isDense: false,
      alignLabelWithHint: true,
      filled: false,
    );
  }
}
