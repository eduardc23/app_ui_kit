import 'package:flutter/material.dart';

import '../../../../app_ui_kit.dart';

/// Campo de texto especializado para la entrada de nombres de usuario.
///
/// El [UsernameField] preconfigura el [AppTextField] para entrada de texto general,
/// desactivando las mayúsculas automáticas y permitiendo límites de longitud.
class UsernameField extends StatelessWidget {
  const UsernameField({
    super.key,
    this.controller,
    this.focusNode,
    this.label = 'Nombre',
    this.hint,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.autovalidateMode,
    this.minLength = 3,
    this.maxLength = 20,
    this.validator,
  });

  /// Controlador del texto.
  final TextEditingController? controller;

  /// Nodo de foco para gestionar el foco del campo.
  final FocusNode? focusNode;

  /// Texto de etiqueta. Por defecto es 'Nombre'.
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

  /// Longitud mínima sugerida.
  final int minLength;

  /// Límite máximo de caracteres permitidos.
  final int maxLength;

  /// Función de validación para el campo.
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      focusNode: focusNode,
      label: label,
      hint: hint,
      keyboardType: TextInputType.text,
      textInputAction: textInputAction,
      textCapitalization: TextCapitalization.none,
      autocorrect: false,
      enabled: enabled,
      maxLength: maxLength,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      validator: validator,
      autovalidateMode: autovalidateMode,
    );
  }
}

