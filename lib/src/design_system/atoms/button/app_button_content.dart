import 'package:flutter/material.dart';

import '../loader/app_loader.dart';
import '../text/app_text.dart';
import '../text/app_text_variant.dart';
import 'app_button.dart';
import '../../../utils/extensions/extensions.dart';

/// Contenido interno del [AppButton].
///
/// Renderiza el [label] en estado normal o un [AppButtonLoader]
/// cuando [isLoading] es `true`.
class AppButtonContent extends StatelessWidget {
  const AppButtonContent({
    required this.label,
    required this.variant,
    required this.isLoading,
    super.key,
  });

  /// Texto del botón.
  final String label;

  /// Variante visual para determinar los colores del cargador.
  final AppButtonVariant variant;

  /// Si es `true`, muestra un cargador en lugar del texto.
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = context.colorScheme;
    final Color loaderColor = switch (variant) {
      AppButtonVariant.primary => scheme.onPrimary,
      AppButtonVariant.secondary => scheme.primary,
    };

    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: isLoading ? 0.0 : 1.0,
          child: AppText(label, variant: AppTextVariant.labelLarge),
        ),
        if (isLoading) AppLoader.small(color: loaderColor),
      ],
    );
  }
}
