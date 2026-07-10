import 'package:flutter/material.dart';

import '../../../../app_ui_kit.dart';

/// Componente molécula para mostrar estados vacíos o informativos.
///
/// El [AppEmptyState] combina un ícono, un título y opcionalmente una
/// descripción y una acción para comunicar al usuario que no hay contenido
/// disponible o que ocurrió un evento que requiere su atención.
class AppEmptyState extends StatelessWidget {
  const AppEmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.description,
    this.actionLabel,
    this.onAction,
  });

  /// Ícono central que representa el estado.
  final IconData icon;

  /// Título principal del mensaje.
  final String title;

  /// Texto descriptivo adicional para dar más contexto.
  final String? description;

  /// Etiqueta del botón de acción opcional.
  final String? actionLabel;

  /// Callback que se ejecuta al presionar el botón de acción.
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIcon(icon, size: AppIconSize.lg, color: scheme.outlineVariant),
            const SizedBox(height: AppSpacing.md),
            AppText(
              title,
              variant: AppTextVariant.titleMedium,
              color: scheme.onSurface,
              textAlign: TextAlign.center,
            ),
            if (description != null) ...[
              const SizedBox(height: AppSpacing.xs),
              AppText(
                description!,
                variant: AppTextVariant.bodyMedium,
                color: scheme.onSurfaceVariant,
                textAlign: TextAlign.center,
              ),
            ],
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: AppSpacing.lg),
              AppButton.primary(label: actionLabel!, onPressed: onAction),
            ],
          ],
        ),
      ),
    );
  }
}
