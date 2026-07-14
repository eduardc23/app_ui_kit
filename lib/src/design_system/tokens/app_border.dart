/// Tokens de grosor de borde del sistema de diseño.
///
/// Garantizan consistencia en todos los componentes que usen bordes:
/// campos de texto, botones, tarjetas, chips, divisores, entre otros.
abstract final class AppBorder {
  /// Grosor fino. Usado en bordes en reposo.
  static const double widthThin = 1.0;

  /// Grosor medio. Usado en bordes con foco activo o énfasis visual.
  static const double widthMedium = 2.0;

  /// Grosor grueso. Reservado para accesibilidad o énfasis especial.
  static const double widthThick = 3.0;
}
