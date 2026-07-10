import 'package:flutter/material.dart';

import '../../../../app_ui_kit.dart';

/// Tema del [AppRangeSlider] del sistema de diseño.
///
/// Define la apariencia global del [RangeSlider] para modo claro y oscuro,
/// integrándose con [SliderThemeData] de Flutter.
abstract final class AppRangeSliderTheme {
  /// [SliderThemeData] para modo claro.
  static SliderThemeData get light => _build(Brightness.light);

  /// [SliderThemeData] para modo oscuro.
  static SliderThemeData get dark => _build(Brightness.dark);

  static SliderThemeData _build(Brightness brightness) {
    final ColorScheme scheme = brightness == Brightness.light
        ? AppColorScheme.light
        : AppColorScheme.dark;

    return SliderThemeData(
      activeTrackColor: scheme.primary,
      inactiveTrackColor: scheme.surfaceContainerHighest,
      thumbColor: scheme.primary,
      overlayColor: scheme.primary.withValues(alpha: AppOpacity.disabledSurface),
      valueIndicatorColor: scheme.primary,
      valueIndicatorTextStyle: AppTypography.labelSmall.copyWith(
        color: scheme.onPrimary,
      ),
      trackHeight: 4.0,
      rangeThumbShape: RoundRangeSliderThumbShape(
        enabledThumbRadius: AppRadius.lg,
      ),
      showValueIndicator: ShowValueIndicator.onDrag,
      rangeValueIndicatorShape:
      const PaddleRangeSliderValueIndicatorShape(),
      disabledActiveTrackColor:
      scheme.onSurface.withValues(alpha: AppOpacity.disabled),
      disabledInactiveTrackColor:
      scheme.onSurface.withValues(alpha: AppOpacity.disabledSurface),
      disabledThumbColor: scheme.onSurface.withValues(alpha: AppOpacity.disabled),
    );
  }
}