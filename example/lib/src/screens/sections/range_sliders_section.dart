import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'section_header.dart';

class RangeSlidersSection extends StatefulWidget {
  const RangeSlidersSection({super.key});

  @override
  State<RangeSlidersSection> createState() => _RangeSlidersSectionState();
}

class _RangeSlidersSectionState extends State<RangeSlidersSection> {
  RangeValues _continuousValues = const RangeValues(0.2, 0.8);
  RangeValues _priceValues = const RangeValues(50, 150);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Sliders de Rango y Filtros'),
        
        const AppText('Slider de Rango Continuo', variant: AppTextVariant.titleSmall),
        AppSpacing.sm.vGap,
        AppRangeSlider(
          values: _continuousValues,
          onChanged: (values) => setState(() => _continuousValues = values),
        ),
        
        AppSpacing.lg.vGap,
        const AppText('Ejemplo de Filtro de Precio', variant: AppTextVariant.titleSmall),
        AppSpacing.sm.vGap,
        AppRangeSlider(
          values: _priceValues,
          min: 0,
          max: 500,
          divisions: 50,
          onChanged: (values) => setState(() => _priceValues = values),
        ),
        
        AppSpacing.xl.vGap,
        const AppText('Resultado de Filtro (Estado Vacío)', variant: AppTextVariant.titleSmall),
        AppSpacing.sm.vGap,
        AppCard(
          child: AppEmptyState(
            icon: Icons.event_busy,
            title: 'No se encontraron eventos',
            description: 'No pudimos encontrar eventos según tus filtros actuales. Intenta ajustando el rango de precios.',
            actionLabel: 'Limpiar filtros',
            onAction: () {
              setState(() {
                _priceValues = const RangeValues(0, 500);
              });
            },
          ),
        ),
        
        AppSpacing.lg.vGap,
        const AppText('Estado Deshabilitado', variant: AppTextVariant.titleSmall),
        AppSpacing.sm.vGap,
        AppRangeSlider(
          values: const RangeValues(0.3, 0.7),
          enabled: false,
          onChanged: (values) {},
        ),
      ],
    );
  }
}
