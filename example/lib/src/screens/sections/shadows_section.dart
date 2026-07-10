import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'section_header.dart';

class ShadowsSection extends StatelessWidget {
  const ShadowsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final elevations = {
      'none': AppElevation.none,
      'sm': AppElevation.sm,
      'md': AppElevation.md,
      'lg': AppElevation.lg,
      'xl': AppElevation.xl,
      'xxl': AppElevation.xxl,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Sombras'),
        Wrap(
          spacing: AppSpacing.xl,
          runSpacing: AppSpacing.xl,
          children: elevations.entries.map((e) {
            return Column(
              children: [
                AppCard(
                  elevation: e.value,
                  padding: EdgeInsets.zero,
                  child: const SizedBox(width: 80, height: 80),
                ),
                AppSpacing.sm.vGap,
                AppText(e.key, variant: AppTextVariant.labelSmall),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
