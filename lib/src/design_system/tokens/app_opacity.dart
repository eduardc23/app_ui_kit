/// Tokens de opacidad del sistema de diseño.
///
/// Garantizan la consistencia en la transparencia de los elementos,
/// especialmente para estados deshabilitados e indicaciones visuales sutiles.
abstract final class AppOpacity {
  /// Opacidad estándar para elementos deshabilitados (38%).
  static const double disabled = 0.38;

  /// Opacidad para bordes y superficies deshabilitadas (12%).
  static const double disabledSurface = 0.12;

  /// Opacidad para texto hint y placeholders (60%).
  static const double hint = 0.60;
}
