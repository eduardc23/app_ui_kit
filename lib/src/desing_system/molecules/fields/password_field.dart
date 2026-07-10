import 'package:flutter/material.dart';
import '../../../../app_ui_kit.dart';

/// Campo de texto especializado para la entrada de contraseñas.
///
/// El [PasswordField] gestiona automáticamente la visibilidad del texto (oscurecimiento)
/// y proporciona un botón para alternar dicha visibilidad.
class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.controller,
    this.focusNode,
    this.label = 'Contraseña',
    this.hint,
    this.textInputAction = TextInputAction.done,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.autovalidateMode,
    this.minLength = 8,
    this.validator,
  });

  /// Controlador del texto.
  final TextEditingController? controller;

  /// Nodo de foco para gestionar el foco del campo.
  final FocusNode? focusNode;

  /// Texto de etiqueta. Por defecto es 'Contraseña'.
  final String? label;

  /// Texto de sugerencia cuando el campo está vacío.
  final String? hint;

  /// Acción a mostrar en el teclado. Por defecto [TextInputAction.done].
  final TextInputAction textInputAction;

  /// Callback que se dispara cada vez que el texto cambia.
  final ValueChanged<String>? onChanged;

  /// Callback que se dispara al enviar el formulario.
  final ValueChanged<String>? onSubmitted;

  /// Indica si el campo está habilitado.
  final bool enabled;

  /// Estrategia de validación automática.
  final AutovalidateMode? autovalidateMode;

  /// Longitud mínima requerida (para validación visual o lógica externa).
  final int minLength;

  /// Función de validación para el campo.
  final FormFieldValidator<String>? validator;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      label: widget.label,
      hint: widget.hint,
      obscureText: _obscure,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: widget.textInputAction,
      autocorrect: false,
      enabled: widget.enabled,
      prefixIcon: const Icon(Icons.lock_outline),
      suffixIcon: IconButton(
        icon: Icon(_obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined),
        onPressed: () => setState(() => _obscure = !_obscure),
        tooltip: _obscure ? 'Mostrar contraseña' : 'Ocultar contraseña',
      ),
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
    );
  }
}