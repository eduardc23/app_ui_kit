import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

class BordersPage extends StatelessWidget {
  const BordersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppText('Borders', variant: AppTextVariant.titleLarge)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _ShowcaseSection(
            title: 'Border Widths',
            child: Column(
              children: [
                _BorderExample(name: 'Thin', width: AppBorder.widthThin),
                AppSpacing.md.vGap,
                _BorderExample(name: 'Medium', width: AppBorder.widthMedium),
                AppSpacing.md.vGap,
                _BorderExample(name: 'Thick', width: AppBorder.widthThick),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BorderExample extends StatelessWidget {
  final String name;
  final double width;

  const _BorderExample({required this.name, required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(width: width, color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: AppText('${width.toInt()}px', variant: AppTextVariant.bodyMedium)),
        ),
        AppSpacing.md.hGap,
        AppText(name, variant: AppTextVariant.titleMedium),
      ],
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
