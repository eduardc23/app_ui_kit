import 'package:flutter/material.dart';
import '../../desing_system/tokens/app_radius.dart';
import '../color_scheme/app_color_scheme.dart';
import '../../desing_system/tokens/app_shadows.dart';

/// Tema de tarjetas ([Card]) del sistema de diseño.
///
/// Define la apariencia base de los contenedores de contenido, utilizando
/// bordes redondeados estándar ([AppRadius.md]) y eliminando elevaciones
/// por defecto para un diseño más limpio y moderno.
abstract final class AppCardTheme {
  /// [CardTheme] para modo claro.
  static CardThemeData get light => _build(Brightness.light);

  /// [CardTheme] para modo oscuro.
  static CardThemeData get dark => _build(Brightness.dark);

  static CardThemeData _build(Brightness brightness) {
    final ColorScheme scheme = brightness == Brightness.light
        ? AppColorScheme.light
        : AppColorScheme.dark;

    return CardThemeData(
      color: scheme.surfaceContainerLow,
      surfaceTintColor: Colors.transparent,
      shadowColor: scheme.shadow,
      elevation: AppElevation.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
    );
  }
}
