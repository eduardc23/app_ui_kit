import 'package:flutter/material.dart';

import '../../tokens/app_icon_size.dart';

/// Componente átomo para mostrar íconos consistentes.
///
/// El [AppIcon] utiliza los tokens de tamaño del sistema y puede actuar
/// como un botón si se proporciona un [onPressed].
class AppIcon extends StatelessWidget {
  const AppIcon(
    this.icon, {
    this.size = AppIconSize.md,
    this.color,
    this.onPressed,
    this.semanticLabel,
    super.key,
  });

  /// El ícono a mostrar.
  final IconData icon;

  /// Tamaño del ícono. Por defecto usa [AppIconSize.md].
  final double size;

  /// Color del ícono. Si es nulo, usa el color por defecto del contexto.
  final Color? color;

  /// Si se proporciona, envuelve el ícono en un [IconButton].
  final VoidCallback? onPressed;

  /// Descripción para accesibilidad.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final resolvedIcon = Icon(
      icon,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
    );

    if (onPressed != null) {
      return IconButton(
        onPressed: onPressed,
        icon: resolvedIcon,
        tooltip: semanticLabel,
        padding: EdgeInsets.zero,
      );
    }

    return resolvedIcon;
  }
}
