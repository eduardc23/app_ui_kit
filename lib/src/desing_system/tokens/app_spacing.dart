/// Tokens de espaciado del sistema de diseño.
///
/// Define la escala de espaciado global basada en una unidad base de 8px.
/// Todos los valores deben usarse en lugar de literales numéricos para
/// garantizar consistencia visual en toda la aplicación.
abstract final class AppSpacing {
  /// Sin espaciado. Útil para neutralizar padding/margin heredado.
  static const double none = 0;

  /// **2px** — Separaciones mínimas, ajustes finos de alineación.
  static const double xxxs = 2;

  /// **4px** — Espaciado entre elementos íntimamente relacionados,
  /// como un ícono y su etiqueta.
  static const double xxs = 4;

  /// **8px** — Unidad base. Separación estándar entre elementos
  /// relacionados dentro de un componente.
  static const double xs = 8;

  /// **12px** — Espaciado interno de componentes compactos
  /// (chips, badges, inputs pequeños).
  static const double sm = 12;

  /// **16px** — Espaciado de uso general. Padding interno de la
  /// mayoría de los componentes (cards, list tiles, botones).
  static const double md = 16;

  /// **20px** — Separación entre secciones relacionadas dentro
  /// de un mismo contenedor.
  static const double lg = 20;

  /// **24px** — Padding de contenedores medianos y separación
  /// entre grupos de componentes.
  static const double xl = 24;

  /// **32px** — Separación entre secciones de una pantalla.
  static const double xxl = 32;

  /// **40px** — Espaciado mayor entre bloques de contenido
  /// visualmente distintos.
  static const double xxxl = 40;

  /// **48px** — Separaciones estructurales amplias,
  /// márgenes de pantalla en tablets.
  static const double xl4 = 48;

  /// **56px** — Espaciado para layouts de alta densidad visual,
  /// separación entre secciones principales.
  static const double xl5 = 56;

  /// **64px** — Espaciado máximo. Hero sections, separaciones
  /// entre módulos en pantallas grandes.
  static const double xl6 = 64;
}