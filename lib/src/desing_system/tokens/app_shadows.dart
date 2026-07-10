/// Tokens de elevación del sistema de diseño.
///
/// Define la profundidad visual de los componentes mediante sombras (z-index),
/// siguiendo la escala de elevación de **Material Design 3**.
abstract final class AppElevation {
  /// Sin elevación. Superficie plana, sin sombra.
  ///
  /// Uso: cards en reposo sobre fondos con contraste suficiente,
  /// contenedores que se diferencian por color, no por profundidad.
  static const double none = 0;

  /// Elevación sutil — nivel 1 de M3 (1 dp).
  ///
  /// Uso: cards en reposo, inputs, chips.
  /// La sombra más discreta; separa el componente del fondo
  /// sin protagonismo visual.
  static const double sm = 1;

  /// Elevación estándar — nivel 2 de M3 (3 dp).
  ///
  /// Uso: cards con hover o foco, dropdowns, popovers.
  /// El nivel más usado en componentes interactivos.
  static const double md = 3;

  /// Elevación prominente — nivel 3 de M3 (6 dp).
  ///
  /// Uso: modales, bottom sheets, menús flotantes.
  /// Comunica que el elemento está por encima del contenido principal.
  static const double lg = 6;

  /// Elevación alta — nivel 4 de M3 (8 dp).
  ///
  /// Uso: dialogs, drawers, side sheets.
  static const double xl = 8;

  /// Elevación máxima — nivel 5 de M3 (12 dp).
  ///
  /// Uso: FABs, tooltips, elementos sobre overlays.
  /// Reservar para lo que deba sentirse "encima de todo".
  static const double xxl = 12;
}
