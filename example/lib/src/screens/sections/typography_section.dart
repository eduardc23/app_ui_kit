import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'section_header.dart';

class TypographySection extends StatelessWidget {
  const TypographySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Tipografía'),
        ...AppTextVariant.values.map((variant) {
          return Padding(
            padding: AppSpacing.xs.vertical,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: AppText(
                    variant.name,
                    variant: AppTextVariant.labelSmall,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: AppText('El veloz murciélago hindú', variant: variant),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
