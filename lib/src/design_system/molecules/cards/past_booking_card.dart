import 'package:flutter/material.dart';

import '../../../utils/extensions/extensions.dart';
import '../../atoms/atoms.dart';
import '../../tokens/tokens.dart';
import 'booking_card_data.dart';

/// Molécula de tarjeta para eventos pasados o finalizados.
///
/// Utiliza un formato horizontal para diferenciar el historial de las
/// reservas activas, aplicando una desaturación visual.
class PastBookingCard extends StatelessWidget {
  const PastBookingCard({
    required this.data,
    required this.ticketsLabel,
    this.statusLabel = 'Pasado',
    this.onTap,
    super.key,
  });

  /// Datos de la reserva a mostrar.
  final BookingCardData data;

  /// Etiqueta para el estado de la reserva (ej: "Pasado", "Finalizado").
  final String statusLabel;

  /// Etiqueta para el número de entradas (ej: "1 entrada", "2 entradas").
  final String ticketsLabel;

  /// Callback al pulsar la tarjeta.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Opacity(
      opacity: AppOpacity.hint,
      child: AppCard(
        padding: EdgeInsets.zero,
        elevation: AppElevation.none,
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          child: Row(
            children: [
              // Imagen miniatura con filtro de escala de grises
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(AppRadius.lg),
                ),
                child: ColorFiltered(
                  colorFilter: const ColorFilter.matrix([
                    0.2126, 0.7152, 0.0722, 0, 0,
                    0.2126, 0.7152, 0.0722, 0, 0,
                    0.2126, 0.7152, 0.0722, 0, 0,
                    0,      0,      0,      1, 0,
                  ]),
                  child: AppImage.network(
                    data.imageUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Contenido central
              Expanded(
                child: Padding(
                  padding: AppSpacing.md.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText(
                        data.title,
                        variant: AppTextVariant.titleSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      AppSpacing.xxs.vGap,
                      AppText(
                        data.date.toEventDate(),
                        variant: AppTextVariant.bodySmall,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      AppSpacing.xxs.vGap,
                      _PastBookingDetails(
                        ticketsLabel: ticketsLabel,
                        price: data.totalPrice,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: AppSpacing.md.right,
                child: _StatusBadge(
                  label: statusLabel,
                  color: colorScheme.surfaceContainerHighest,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Detalles de entradas y precio con separador de punto.
class _PastBookingDetails extends StatelessWidget {
  const _PastBookingDetails({
    required this.ticketsLabel,
    required this.price,
    required this.color,
  });

  final String ticketsLabel;
  final double price;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(
          ticketsLabel,
          variant: AppTextVariant.bodySmall,
          color: color,
        ),
        AppSpacing.xs.hGap,
        Container(
          width: 3,
          height: 3,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        AppSpacing.xs.hGap,
        AppText(
          '\$${price.toStringAsFixed(0)}',
          variant: AppTextVariant.labelMedium,
          color: color,
        ),
      ],
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xs,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: AppText(label, variant: AppTextVariant.labelSmall),
    );
  }
}
