import 'package:flutter/material.dart';
import '../../../../app_ui_kit.dart';

/// Fila de metadato con icono + texto usada en tarjetas de evento.
class EventCardMetaRow extends StatelessWidget {
  const EventCardMetaRow({
    required this.icon,
    required this.label,
    required this.color,
    super.key,
  });

  /// Ícono descriptivo del metadato.
  final IconData icon;

  /// Texto del metadato.
  final String label;

  /// Color aplicado tanto al ícono como al texto.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppIcon(icon, size: AppIconSize.xs, color: color),
        AppSpacing.xxs.hGap,
        Expanded(
          child: AppText(
            label,
            variant: AppTextVariant.bodySmall,
            color: color,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
