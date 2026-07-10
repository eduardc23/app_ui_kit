import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'section_header.dart';

class RadiusSection extends StatelessWidget {
  const RadiusSection({super.key});

  @override
  Widget build(BuildContext context) {
    final radii = {
      'xs': AppRadius.xs,
      'sm': AppRadius.sm,
      'md': AppRadius.md,
      'lg': AppRadius.lg,
      'xl': AppRadius.xl,
      'full': AppRadius.full,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Radios'),
        Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.md,
          children: radii.entries.map((e) {
            return Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.blue200,
                    borderRadius: BorderRadius.circular(e.value),
                  ),
                ),
                AppSpacing.xxs.vGap,
                AppText(e.key, variant: AppTextVariant.labelSmall),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
