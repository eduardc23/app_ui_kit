import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Átomo de campo de texto del sistema de diseño.
///
/// Envuelve [TextFormField] y aplica automáticamente los estilos del tema.
/// Compatible con [Form] para validación reactiva y manejo de estados.
///
class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.suffix,
    this.prefixText,
    this.suffixText,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.autocorrect = true,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.onTapOutside,
    this.validator,
    this.autovalidateMode,
  });

  /// Controlador del texto.
  final TextEditingController? controller;

  /// Nodo de foco para gestionar el foco del campo.
  final FocusNode? focusNode;

  /// Valor inicial cuando no se usa [controller].
  final String? initialValue;

  /// Texto de etiqueta que se muestra arriba o dentro del campo.
  final String? label;

  /// Texto de sugerencia cuando el campo está vacío.
  final String? hint;

  /// Texto de ayuda debajo del campo.
  final String? helperText;

  /// Texto de error que sobreescribe el error del [validator].
  final String? errorText;

  /// Widget que aparece al inicio del campo.
  final Widget? prefixIcon;

  /// Widget que aparece al final del campo.
  final Widget? suffixIcon;

  /// Widget personalizado al inicio del área de texto.
  final Widget? prefix;

  /// Widget personalizado al final del área de texto.
  final Widget? suffix;

  /// Texto estático al inicio del campo.
  final String? prefixText;

  /// Texto estático al final del campo.
  final String? suffixText;

  /// Oculta el texto ingresado (ideal para contraseñas).
  final bool obscureText;

  /// Indica si el campo está habilitado para interacción.
  final bool enabled;

  /// Si es `true`, el texto no se puede editar pero se puede seleccionar.
  final bool readOnly;

  /// Si el campo debe ganar el foco automáticamente.
  final bool autofocus;

  /// Si se debe habilitar la autocorrección.
  final bool autocorrect;

  /// Número máximo de líneas. Si [obscureText] es true, se fuerza a 1.
  final int? maxLines;

  /// Número mínimo de líneas.
  final int? minLines;

  /// Límite de caracteres permitidos.
  final int? maxLength;

  /// Tipo de teclado a mostrar.
  final TextInputType? keyboardType;

  /// Acción a mostrar en el teclado (e.g., done, next).
  final TextInputAction? textInputAction;

  /// Configuración de mayúsculas automáticas.
  final TextCapitalization textCapitalization;

  /// Lista de formateadores para la entrada de texto.
  final List<TextInputFormatter>? inputFormatters;

  /// Callback que se dispara cada vez que el texto cambia.
  final ValueChanged<String>? onChanged;

  /// Callback que se dispara al enviar el formulario desde el teclado.
  final ValueChanged<String>? onSubmitted;

  /// Callback al tocar el campo.
  final GestureTapCallback? onTap;

  /// Callback al tocar fuera del campo.
  final TapRegionCallback? onTapOutside;

  /// Función de validación para formularios.
  final FormFieldValidator<String>? validator;

  /// Estrategia de validación automática.
  final AutovalidateMode? autovalidateMode;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      initialValue: widget.initialValue,
      obscureText: widget.obscureText,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      autocorrect: widget.autocorrect,
      maxLines: widget.obscureText ? 1 : widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      textCapitalization: widget.textCapitalization,
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      onTap: widget.onTap,
      onTapOutside: widget.onTapOutside,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        helperText: widget.helperText,
        errorText: widget.errorText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        prefix: widget.prefix,
        suffix: widget.suffix,
        prefixText: widget.prefixText,
        suffixText: widget.suffixText,
      ),
    );
  }
}
