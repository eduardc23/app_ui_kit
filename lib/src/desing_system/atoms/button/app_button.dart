import 'package:flutter/material.dart';
import 'app_button_content.dart';

/// Variantes visuales del [AppButton].
///
/// - [primary]   — Acción principal de la pantalla. Alto énfasis.
/// - [secondary] — Acción secundaria o complementaria. Énfasis medio.
enum AppButtonVariant { primary, secondary }

/// Botón estándar del sistema de diseño.
///
/// Componente átomo de un solo tamaño (`md`) con dos variantes
/// visuales. Los estilos (colores, shape, padding) se resuelven
/// globalmente desde [AppButtonTheme] — este widget solo gestiona
/// estructura y estado.
class AppButton extends StatelessWidget {
  const AppButton._({
    required this.label,
    required this.variant,
    required this.onPressed,
    this.isLoading = false,
    this.expanded = false,
    super.key,
  });

  /// Acción principal de la pantalla.
  const factory AppButton.primary({
    Key? key,
    required String label,
    required VoidCallback? onPressed,
    bool isLoading,
    bool expanded,
  }) = _AppButtonPrimary;

  /// Acción secundaria o complementaria.
  const factory AppButton.secondary({
    Key? key,
    required String label,
    required VoidCallback? onPressed,
    bool isLoading,
    bool expanded,
  }) = _AppButtonSecondary;

  /// Texto del botón.
  final String label;

  /// Variante visual del botón.
  final AppButtonVariant variant;

  /// Callback al presionar. `null` deshabilita el botón.
  final VoidCallback? onPressed;

  /// Muestra un [AppButtonLoader] en lugar del texto.
  /// El botón queda deshabilitado mientras [isLoading] es `true`.
  final bool isLoading;

  /// Si es `true`, el botón ocupa todo el ancho disponible.
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null || isLoading;

    final Widget button = switch (variant) {
      AppButtonVariant.primary => FilledButton(
        onPressed: isDisabled ? null : onPressed,
        child: AppButtonContent(
          label: label,
          variant: variant,
          isLoading: isLoading,
        ),
      ),
      AppButtonVariant.secondary => OutlinedButton(
        onPressed: isDisabled ? null : onPressed,
        child: AppButtonContent(
          label: label,
          variant: variant,
          isLoading: isLoading,
        ),
      ),
    };

    if (expanded) return SizedBox(width: double.infinity, child: button);

    return button;
  }
}

// Implementaciones internas de factory
class _AppButtonPrimary extends AppButton {
  const _AppButtonPrimary({
    super.key,
    required super.label,
    required super.onPressed,
    super.isLoading = false,
    super.expanded = false,
  }) : super._(variant: AppButtonVariant.primary);
}

class _AppButtonSecondary extends AppButton {
  const _AppButtonSecondary({
    super.key,
    required super.label,
    required super.onPressed,
    super.isLoading = false,
    super.expanded = false,
  }) : super._(variant: AppButtonVariant.secondary);
}
