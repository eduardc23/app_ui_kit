import 'package:flutter/material.dart';

import '../../../utils/extensions/extensions.dart';
import '../../atoms/atoms.dart';
import '../../tokens/tokens.dart';
import 'event_card_data.dart';
import 'event_card_meta_row.dart';

/// Molécula de tarjeta para mostrar información resumida de un evento.
///
/// El [EventCard] presenta una imagen de portada, el nombre del evento,
/// el lugar, la fecha y el precio. Está diseñada para ser usada en listas
/// o grids de eventos.
class EventCard extends StatelessWidget {
  const EventCard({
    required this.data,
    this.onTap,
    this.imageHeight = 180,
    super.key,
  });

  /// Datos del evento a mostrar.
  final EventCardData data;

  /// Callback al pulsar la tarjeta. Navega a la pantalla de detalle.
  final VoidCallback? onTap;

  /// Altura de la imagen de portada.
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return AppCard(
      padding: EdgeInsets.zero,
      // La imagen ocupa el borde superior sin padding.
      elevation: AppElevation.sm,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Imagen de portada
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(AppRadius.md),
              ),
              child: AppImage.network(
                data.imageUrl,
                height: imageHeight,
                width: double.infinity,
              ),
            ),

            // Cuerpo de la tarjeta
            Padding(
              padding: AppSpacing.md.all,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nombre del evento
                  AppText(data.name, variant: AppTextVariant.titleMedium),
                  AppSpacing.xs.vGap,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            EventCardMetaRow(
                              icon: Icons.location_on_outlined,
                              label: data.venueName,
                              color: colorScheme.onSurfaceVariant,
                            ),
                            AppSpacing.xxs.vGap,
                            EventCardMetaRow(
                              icon: Icons.calendar_today_outlined,
                              label: data.date.toEventDate(),
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ],
                        ),
                      ),
                      AppSpacing.sm.hGap,
                      AppText(
                        data.isFree ? 'Gratis' : '\$${data.price}',
                        variant: AppTextVariant.titleMedium,
                        color: colorScheme.primary,
                      ),
                    ],
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
