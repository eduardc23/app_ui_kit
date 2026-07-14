import 'package:flutter/material.dart';

import '../../design_system/tokens/tokens.dart';
import '../color_scheme/app_color_scheme.dart';

/// Tema del [AppBar] del sistema de diseño.
///
/// Define la apariencia global del [AppBar] para modo claro y oscuro,
abstract final class AppAppBarTheme {
  /// [AppBarTheme] para modo claro.
  static AppBarTheme get light => _build(Brightness.light);

  /// [AppBarTheme] para modo oscuro.
  static AppBarTheme get dark => _build(Brightness.dark);

  static AppBarTheme _build(Brightness brightness) {
    final ColorScheme scheme = brightness == Brightness.light
        ? AppColorScheme.light
        : AppColorScheme.dark;

    return AppBarTheme(
      backgroundColor: scheme.surface,
      foregroundColor: scheme.onSurface,
      surfaceTintColor: scheme.surfaceTint,
      shadowColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 1,
      centerTitle: false,
      titleTextStyle: AppTypography.titleLarge.copyWith(
        color: scheme.onSurface,
      ),
      toolbarTextStyle: AppTypography.bodyMedium.copyWith(
        color: scheme.onSurface,
      ),
      iconTheme: IconThemeData(
        color: scheme.onSurface,
        size: AppIconSize.md,
      ),
      actionsIconTheme: IconThemeData(
        color: scheme.onSurfaceVariant,
        size: AppIconSize.md,
      ),
    );
  }
}
