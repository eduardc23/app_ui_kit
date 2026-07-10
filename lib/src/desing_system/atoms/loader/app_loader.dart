import 'package:flutter/material.dart';

import '../../../../app_ui_kit.dart';

/// Componente átomo para indicar estados de carga.
///
/// El [AppLoader] proporciona un indicador de progreso circular consistente
/// con el tamaño de los íconos y el color primario del sistema.
class AppLoader extends StatelessWidget {
  const AppLoader._({
    required this.size,
    this.color,
    this.strokeWidth = AppBorder.widthMedium,
    super.key,
  });

  /// Variante pequeña para usar dentro de otros componentes como botones.
  const factory AppLoader.small({
    Color? color,
    Key? key,
  }) = _AppLoaderSmall;

  /// Variante mediana para estados de carga de sección.
  const factory AppLoader.medium({
    Color? color,
    Key? key,
  }) = _AppLoaderMedium;

  /// Tamaño (diámetro) del cargador.
  final double size;

  /// Color del indicador. Por defecto usa el color primario del tema.
  final Color? color;

  /// Grosor de la línea del círculo.
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        color: color ?? Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

// Implementaciones internas de factory

class _AppLoaderSmall extends AppLoader {
  const _AppLoaderSmall({super.color, super.key})
    : super._(size: AppIconSize.sm);
}

class _AppLoaderMedium extends AppLoader {
  const _AppLoaderMedium({super.color, super.key})
    : super._(size: AppIconSize.md);
}
