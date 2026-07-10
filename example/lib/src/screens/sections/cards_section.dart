import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'section_header.dart';

class CardsSection extends StatelessWidget {
  const CardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Tarjetas'),
        AppCard(
          elevation: AppElevation.sm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppText('Tarjeta Estándar', variant: AppTextVariant.titleMedium),
              AppSpacing.xs.vGap,
              AppText(
                'Esta es una AppCard con elevación sm.',
                variant: AppTextVariant.bodyMedium,
              ),
            ],
          ),
        ),
        AppSpacing.md.vGap,
        AppCard(
          elevation: AppElevation.lg,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppText('Tarjeta Elevada', variant: AppTextVariant.titleMedium),
              AppSpacing.xs.vGap,
              AppText(
                'Esta tarjeta usa una elevación lg.',
                variant: AppTextVariant.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
