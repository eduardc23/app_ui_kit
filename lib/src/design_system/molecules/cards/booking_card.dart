import 'package:flutter/material.dart';

import '../../../utils/extensions/extensions.dart';
import '../../atoms/atoms.dart';
import '../../tokens/tokens.dart';
import 'booking_card_data.dart';
import 'event_card_meta_row.dart';

/// Molécula de tarjeta para mostrar información de una reserva próxima.
class BookingCard extends StatelessWidget {
  const BookingCard({
    required this.data,
    required this.timeLabel,
    this.onTap,
    this.imageHeight = 140,
    super.key,
  });

  /// Datos de la reserva a mostrar.
  final BookingCardData data;

  /// Etiqueta de tiempo (ej: "Hoy", "Mañana", "En 2 días").
  final String timeLabel;

  /// Callback al pulsar la tarjeta.
  final VoidCallback? onTap;

  /// Altura de la sección de la imagen.
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return AppCard(
      padding: EdgeInsets.zero,
      elevation: AppElevation.sm,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Imagen con Badge de tiempo restante
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(AppRadius.md),
                  ),
                  child: AppImage.network(
                    data.imageUrl,
                    height: imageHeight,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: AppSpacing.sm,
                  right: AppSpacing.sm,
                  child: _DaysLeftBadge(label: timeLabel),
                ),
              ],
            ),

            // Contenido de la tarjeta
            Padding(
              padding: AppSpacing.md.all,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    data.title,
                    variant: AppTextVariant.titleMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AppSpacing.xs.vGap,

                  // Fecha
                  EventCardMetaRow(
                    icon: Icons.calendar_today_outlined,
                    label: data.date.toEventDate(),
                    color: colorScheme.onSurfaceVariant,
                  ),
                  AppSpacing.xxs.vGap,

                  // Tickets y Precio
                  EventCardMetaRow(
                    icon: Icons.confirmation_number_outlined,
                    label:
                        '${data.tickets} ${data.tickets == 1 ? 'entrada' : 'entradas'} · \$${data.totalPrice.toStringAsFixed(0)}',
                    color: colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Pequeño badge sobre la imagen para indicar proximidad de la fecha.
class _DaysLeftBadge extends StatelessWidget {
  const _DaysLeftBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AppIcon(
            Icons.schedule_rounded,
            size: AppIconSize.xs,
            color: Colors.white,
          ),
          AppSpacing.xxs.hGap,
          AppText(
            label,
            variant: AppTextVariant.labelSmall,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
