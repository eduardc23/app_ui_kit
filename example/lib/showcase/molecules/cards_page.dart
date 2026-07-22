import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

class EventCardsPage extends StatelessWidget {
  const EventCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(title: const AppText('Event Cards', variant: AppTextVariant.titleLarge)),
      body: ListView(
        padding: AppSpacing.md.all,
        children: [
          _ShowcaseSection(
            title: 'Event Card',
            child: EventCard(
              data: EventCardData(
                name: 'Festival de Jazz de Bogotá',
                venueName: 'Teatro Jorge Eliécer Gaitán',
                date: DateTime.now().add(const Duration(days: 30)),
                price: "85000",
                imageUrl: 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?auto=format&fit=crop&q=80&w=400',
              ),
              onTap: () {},
            ),
          ),
          _ShowcaseSection(
            title: 'Free Event Card',
            child: EventCard(
              data: EventCardData(
                name: 'Taller de Pintura al Aire Libre',
                venueName: 'Parque de la 93',
                date: DateTime.now().add(const Duration(days: 15)),
                price: "0",
                imageUrl: 'https://images.unsplash.com/photo-1460661419201-fd4cecdf8a8b?auto=format&fit=crop&q=80&w=400',
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _ShowcaseSection extends StatelessWidget {
  final String title;
  final Widget child;

  const _ShowcaseSection({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title,
          variant: AppTextVariant.titleMedium,
        ),
        AppSpacing.sm.vGap,
        child,
        AppSpacing.xxl.vGap,
      ],
    );
  }
}
