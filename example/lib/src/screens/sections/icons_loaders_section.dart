import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'section_header.dart';

class IconsLoadersSection extends StatelessWidget {
  const IconsLoadersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Iconos y Cargadores'),
        const AppText('Cargadores', variant: AppTextVariant.titleSmall),
        AppSpacing.sm.vGap,
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [AppLoader.small(), AppLoader.medium()],
        ),
        AppSpacing.lg.vGap,
        const AppText('Tamaños de Icono', variant: AppTextVariant.titleSmall),
        AppSpacing.sm.vGap,
        const Wrap(
          spacing: AppSpacing.md,
          children: [
            AppIcon(Icons.star, size: AppIconSize.xs),
            AppIcon(Icons.star, size: AppIconSize.sm),
            AppIcon(Icons.star, size: AppIconSize.md),
            AppIcon(Icons.star, size: AppIconSize.lg),
          ],
        ),
      ],
    );
  }
}
