import 'package:flutter/material.dart';

import '../../design_system/tokens/tokens.dart';
import '../color_scheme/app_color_scheme.dart';

/// Tema del [NavigationBar] del sistema de diseño.
///
/// Define la apariencia global de la barra de navegación (Material 3)
/// para modo claro y oscuro.
abstract final class AppNavigationBarTheme {
  /// [NavigationBarThemeData] para modo claro.
  static NavigationBarThemeData get light => _build(Brightness.light);

  /// [NavigationBarThemeData] para modo oscuro.
  static NavigationBarThemeData get dark => _build(Brightness.dark);

  static NavigationBarThemeData _build(Brightness brightness) {
    final ColorScheme scheme = brightness == Brightness.light
        ? AppColorScheme.light
        : AppColorScheme.dark;

    return NavigationBarThemeData(
      backgroundColor: scheme.surfaceContainer,
      indicatorColor: scheme.primaryContainer,
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(
            size: AppIconSize.md,
            color: scheme.surface,
          );
        }
        return IconThemeData(
          size: AppIconSize.md,
          color: scheme.onSurfaceVariant,
        );
      }),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppTypography.labelMedium.copyWith(
            color: scheme.primary,
            fontWeight: FontWeight.w600,
          );
        }
        return AppTypography.labelMedium.copyWith(
          color: scheme.onSurfaceVariant,
        );
      }),
      elevation: 0,
      height: 80,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
    );
  }
}
