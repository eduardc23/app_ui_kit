/// Tokens de tamaño de ícono del sistema de diseño.
///
/// Garantizan la consistencia visual en las dimensiones de los íconos
/// utilizados en diferentes contextos de la interfaz.
abstract final class AppIconSize {
  /// **16px** — Tamaño extra pequeño. Usado en badges o texto denso.
  static const double xs = 16;

  /// **18px** — Tamaño pequeño. Usado en chips y botones compactos.
  static const double sm = 18;

  /// **24px** — Tamaño estándar. El tamaño por defecto para la mayoría de los íconos.
  static const double md = 24;

  /// **32px** — Tamaño grande. Usado para destacar íconos en pantallas vacías o headers.
  static const double lg = 32;
}
