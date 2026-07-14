import 'package:flutter/material.dart';

/// Formatea el valor del label según el tipo de rango.
typedef AppRangeSliderLabelFormatter = String Function(double value);

/// Átomo de slider de rango doble.
///
/// Permite al usuario seleccionar un rango de valores entre
/// un mínimo y un máximo. Usa [AppRangeSliderTheme] para
/// su apariencia y respeta el [SliderTheme] del contexto.
class AppRangeSlider extends StatelessWidget {
  AppRangeSlider({
    super.key,
    required this.values,
    required this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.labelFormatter,
  })  : assert(min < max, 'min debe ser estrictamente menor que max.'),
        assert(
          values.start >= min &&
              values.end <= max &&
              values.start <= values.end,
          'values debe cumplir min ≤ start ≤ end ≤ max.',
        ),
        assert(
          divisions == null || divisions > 0,
          'divisions debe ser null (continuo) o un entero positivo.',
        );

  /// Rango actualmente seleccionado.
  final RangeValues values;

  /// Valor mínimo del slider.
  final double min;

  /// Valor máximo del slider.
  final double max;

  /// Número de divisiones discretas. Si es null, el slider es continuo.
  final int? divisions;

  /// Callback al cambiar el rango.
  final ValueChanged<RangeValues>? onChanged;

  /// Formatea los labels de los thumbs.
  /// Por defecto muestra el valor redondeado.
  final AppRangeSliderLabelFormatter? labelFormatter;

  static String _defaultFormatter(double value) => value.round().toString();

  @override
  Widget build(BuildContext context) {
    final formatter = labelFormatter ?? _defaultFormatter;

    return RangeSlider(
      values: values,
      min: min,
      max: max,
      divisions: divisions,
      // Labels solo tienen efecto visual cuando divisions != null
      labels: divisions != null
          ? RangeLabels(formatter(values.start), formatter(values.end))
          : null,
      onChanged: onChanged,
    );
  }
}
