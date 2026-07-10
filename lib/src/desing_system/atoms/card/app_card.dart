import 'package:flutter/material.dart';

import '../../../../app_ui_kit.dart';

/// Contenedor base para agrupar contenido relacionado.
///
/// El [AppCard] proporciona una superficie con bordes redondeados y
/// espaciado interno predeterminado, siguiendo las guías de elevación
/// y color del sistema de diseño.
class AppCard extends StatelessWidget {
  const AppCard({
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.md),
    this.color,
    this.borderRadius,
    this.elevation = AppElevation.none,
    super.key,
  });

  /// Widget contenido dentro de la tarjeta.
  final Widget child;

  /// Espaciado interno de la tarjeta. Por defecto es [AppSpacing.md].
  final EdgeInsetsGeometry padding;

  /// Color de fondo de la tarjeta. Si es nulo, usa el color de superficie del tema.
  final Color? color;

  /// Radio de los bordes. Si es nulo, usa [AppRadius.md] definido en el tema.
  final BorderRadiusGeometry? borderRadius;

  /// Nivel de elevación/sombra. Por defecto es [AppElevation.none].
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: elevation,
      shape: borderRadius != null
          ? RoundedRectangleBorder(borderRadius: borderRadius!)
          : null,
      child: Padding(padding: padding, child: child),
    );
  }
}
