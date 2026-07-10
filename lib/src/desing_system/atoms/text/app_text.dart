import 'package:flutter/material.dart';

import '../../../../app_ui_kit.dart';

/// Componente átomo para el manejo de texto tipográfico.
///
/// El [AppText] centraliza el uso de la escala tipográfica del sistema,
/// asegurando que todos los textos usen los tokens de [AppTypography].
class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    required this.variant,
    this.color,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.semanticsLabel,
    super.key,
  });

  /// Contenido del texto.
  final String text;

  /// Variante tipográfica a aplicar.
  final AppTextVariant variant;

  /// Color del texto. Si es nulo, usa el color por defecto definido en el tema.
  final Color? color;

  /// Alineación del texto.
  final TextAlign? textAlign;

  /// Comportamiento ante el desbordamiento.
  final TextOverflow? overflow;

  /// Número máximo de líneas.
  final int? maxLines;

  /// Si el texto debe saltar de línea automáticamente.
  final bool? softWrap;

  /// Etiqueta para accesibilidad.
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final baseStyle = variant.textStyle;
    return Text(
      text,
      style: color != null ? baseStyle.copyWith(color: color) : baseStyle,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
    );
  }
}
