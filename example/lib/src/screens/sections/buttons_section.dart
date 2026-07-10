import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'section_header.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Botones'),
        const AppText('Variantes Primarias', variant: AppTextVariant.titleSmall),
        AppSpacing.sm.vGap,
        Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.md,
          children: [
            AppButton.primary(label: 'Habilitado', onPressed: () {}),
            AppButton.primary(
              label: 'Cargando',
              onPressed: () {},
              isLoading: true,
            ),
            AppButton.primary(label: 'Deshabilitado', onPressed: null),
          ],
        ),
        AppSpacing.lg.vGap,
        const AppText('Variantes Secundarias', variant: AppTextVariant.titleSmall),
        AppSpacing.sm.vGap,
        Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.md,
          children: [
            AppButton.secondary(label: 'Habilitado', onPressed: () {}),
            AppButton.secondary(
              label: 'Cargando',
              onPressed: () {},
              isLoading: true,
            ),
            AppButton.secondary(label: 'Deshabilitado', onPressed: null),
          ],
        ),
        AppSpacing.lg.vGap,
        const AppText('Ancho Completo', variant: AppTextVariant.titleSmall),
        AppSpacing.sm.vGap,
        AppButton.primary(
          label: 'Botón Expandido',
          onPressed: () {},
          expanded: true,
        ),
      ],
    );
  }
}
