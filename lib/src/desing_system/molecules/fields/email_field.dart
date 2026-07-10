import 'package:flutter/material.dart';

import '../../../../app_ui_kit.dart';

/// Campo de texto especializado para la entrada de correos electrónicos.
///
/// El [EmailField] preconfigura el [AppTextField] con el teclado de email,
/// desactiva la autocorrección y añade un ícono de sobre predeterminado.
class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    this.controller,
    this.focusNode,
    this.label = 'Correo electrónico',
    this.hint,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.autovalidateMode,
    this.validator,
  });

  /// Controlador del texto.
  final TextEditingController? controller;

  /// Nodo de foco para gestionar el foco del campo.
  final FocusNode? focusNode;

  /// Texto de etiqueta. Por defecto es 'Correo electrónico'.
  final String? label;

  /// Texto de sugerencia cuando el campo está vacío.
  final String? hint;

  /// Acción a mostrar en el teclado. Por defecto [TextInputAction.next].
  final TextInputAction textInputAction;

  /// Callback que se dispara cada vez que el texto cambia.
  final ValueChanged<String>? onChanged;

  /// Callback que se dispara al enviar el formulario.
  final ValueChanged<String>? onSubmitted;

  /// Indica si el campo está habilitado.
  final bool enabled;

  /// Estrategia de validación automática.
  final AutovalidateMode? autovalidateMode;

  /// Función de validación para el campo.
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      focusNode: focusNode,
      label: label,
      hint: hint,
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
      textCapitalization: TextCapitalization.none,
      autocorrect: false,
      enabled: enabled,
      prefixIcon: const Icon(Icons.email_outlined),
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      validator: validator,
      autovalidateMode: autovalidateMode,
    );
  }
}
