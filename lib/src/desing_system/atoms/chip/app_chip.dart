import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

/// Variantes visuales y funcionales del [AppChip].
///
/// - [filter] — Seleccionable, muestra checkmark al seleccionar.
///              Ejemplo: chips de categorías (Música, Tech…).
/// - [input]  — Seleccionable con ícono fijo, sin checkmark.
///              Ejemplo: 🎶 Music, donde el ícono siempre se muestra.
enum AppChipVariant { filter, input }

/// Componente átomo para mostrar etiquetas interactivas.
class AppChip extends StatelessWidget {
  const AppChip._({
    required this.label,
    required this.variant,
    this.onSelected,
    this.selected = false,
    this.avatar,
    super.key,
  });

  /// Chip seleccionable que muestra ✓ al activarse.
  ///
  /// Util para filtros de categoría donde el check
  /// confirma visualmente la selección.
  factory AppChip.filter({
    Key? key,
    required String label,
    bool selected = false,
    ValueChanged<bool>? onSelected,
  }) {
    return AppChip._(
      key: key,
      label: label,
      variant: AppChipVariant.filter,
      selected: selected,
      onSelected: onSelected,
    );
  }

  /// Chip seleccionable con ícono fijo, sin checkmark.
  ///
  /// El [avatar] siempre es visible independientemente
  /// del estado de selección. Úsalo cuando el ícono
  /// ya comunica el contexto (ej: 🎶 Music).
  factory AppChip.input({
    Key? key,
    required String label,
    required Widget avatar,
    bool selected = false,
    ValueChanged<bool>? onSelected,
  }) {
    return AppChip._(
      key: key,
      label: label,
      variant: AppChipVariant.input,
      selected: selected,
      onSelected: onSelected,
      avatar: avatar,
    );
  }

  /// Texto que se muestra en el chip.
  final String label;

  /// Variante visual y funcional del chip.
  final AppChipVariant variant;

  /// Callback que se ejecuta al seleccionar o deseleccionar el chip.
  final ValueChanged<bool>? onSelected;

  /// Indica si el chip está seleccionado.
  final bool selected;

  /// Widget que se muestra al inicio del chip (solo para [AppChipVariant.input]).
  final Widget? avatar;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isSelected =
        selected &&
        (variant == AppChipVariant.filter || variant == AppChipVariant.input);

    final labelColor = isSelected ? scheme.onPrimary : scheme.onSurface;

    final labelWidget = AppText(
      label,
      variant: AppTextVariant.labelLarge,
      color: labelColor,
      textAlign: TextAlign.center,
    );

    return switch (variant) {
      AppChipVariant.filter => FilterChip(
        label: labelWidget,
        selected: selected,
        onSelected: onSelected,
      ),

      // Ícono siempre visible, sin checkmark
      AppChipVariant.input => InputChip(
        label: labelWidget,
        avatar: avatar,
        selected: selected,
        showCheckmark: false,
        onSelected: onSelected,
      ),
    };
  }
}
