import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

import 'sections/buttons_section.dart';
import 'sections/cards_section.dart';
import 'sections/chips_section.dart';
import 'sections/icons_loaders_section.dart';
import 'sections/molecules_section.dart';
import 'sections/radius_section.dart';
import 'sections/range_sliders_section.dart';
import 'sections/shadows_section.dart';
import 'sections/text_fields_section.dart';
import 'sections/typography_section.dart';

class DesignSystemScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final ThemeMode currentMode;

  const DesignSystemScreen({
    super.key,
    required this.onToggleTheme,
    required this.currentMode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: const AppText(
          'App UI Kit Showcase',
          variant: AppTextVariant.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: onToggleTheme,
            icon: AppIcon(
              currentMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: AppSpacing.md.all,
        children: [
          const TypographySection(),
          AppSpacing.lg.vGap,
          const RadiusSection(),
          AppSpacing.lg.vGap,
          const ShadowsSection(),
          AppSpacing.xl.vGap,
          const ButtonsSection(),
          AppSpacing.xl.vGap,
          const TextFieldsSection(),
          AppSpacing.xl.vGap,
          const ChipsSection(),
          AppSpacing.xl.vGap,
          const CardsSection(),
          AppSpacing.xl.vGap,
          const IconsLoadersSection(),
          AppSpacing.xl.vGap,
          const RangeSlidersSection(),
          AppSpacing.xl.vGap,
          const MoleculesSection(),
          AppSpacing.xl4.vGap,
        ],
      ),
    );
  }
}
