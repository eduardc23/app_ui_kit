/// Tokens de radio de borde del sistema de diseño.
///
/// Define la escala global de bordes redondeados (`border-radius`).
///
abstract final class AppRadius {
  /// Sin redondeo. Para elementos que deben mantener esquinas perfectamente rectas.
  static const double none = 0;

  /// **2px** — Redondeo sutil. Suaviza esquinas sin alterar
  /// visualmente la forma del elemento.
  static const double xs = 2;

  /// **4px** — Redondeo leve. Estándar para elementos
  /// compactos como inputs y chips.
  static const double sm = 4;

  /// **8px** — Redondeo base. El valor más usado en botones,
  /// cards pequeñas y contenedores generales.
  static const double md = 8;

  /// **12px** — Redondeo medio. Cards estándar, modales
  /// y contenedores con mayor protagonismo visual.
  static const double lg = 12;

  /// **16px** — Redondeo amplio. Bottom sheets, paneles
  /// y superficies que emergen sobre el contenido.
  static const double xl = 16;

  /// **24px** — Redondeo generoso. Cards destacadas,
  /// dialogs y contenedores con estilo moderno.
  static const double xxl = 24;

  /// **32px** — Redondeo pronunciado. Ilustraciones,
  /// contenedores hero y elementos de alto impacto visual.
  static const double xxxl = 32;

  /// **999px** — Redondeo total. Produce formas de píldora.
  /// Se usa en avatares, FABs, toggles y botones píldora.
  ///
  /// Se usa `999` en lugar de `double.infinity` porque Flutter
  /// requiere un valor finito en [BorderRadius.circular].
  static const double full = 999;
}