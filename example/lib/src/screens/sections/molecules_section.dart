import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'section_header.dart';

class MoleculesSection extends StatelessWidget {
  const MoleculesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Moléculas'),
        const AppText('Tarjeta de Evento', variant: AppTextVariant.titleSmall),
        AppSpacing.sm.vGap,
        EventCard(
          data: EventCardData(
            imageUrl: 'https://images.unsplash.com/photo-1501281668745-f7f57925c3b4?auto=format&fit=crop&q=80&w=800',
            name: 'Festival de Música Electrónica 2025',
            venueName: 'Estadio Olímpico',
            date: DateTime(2025, 12, 15, 21, 0),
            price: "45.000",
          ),
          onTap: () {},
        ),
        AppSpacing.xl.vGap,
        const AppText('Estado Vacío', variant: AppTextVariant.titleSmall),
        AppSpacing.sm.vGap,
        AppCard(
          child: AppEmptyState(
            icon: Icons.search_off,
            title: 'No se encontraron resultados',
            description: 'No pudimos encontrar lo que estás buscando.',
            actionLabel: 'Intentar de nuevo',
            onAction: () {},
          ),
        ),
      ],
    );
  }
}
