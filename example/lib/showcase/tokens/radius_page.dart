import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

class RadiusPage extends StatelessWidget {
  const RadiusPage({super.key});

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

    return AppScaffold(
      appBar: AppBar(title: const AppText('Radius', variant: AppTextVariant.titleLarge)),
      body: ListView(
        padding: AppSpacing.md.all,
        children: [
          _ShowcaseSection(
            title: 'Border Radius Tokens',
            child: Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.md,
              children: radii.entries.map((e) {
                return Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: context.colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(e.value),
                      ),
                      child: Center(
                        child: AppText(
                          '${e.value.toInt()}',
                          variant: AppTextVariant.labelLarge,
                        ),
                      ),
                    ),
                    AppSpacing.xs.vGap,
                    AppText(e.key, variant: AppTextVariant.bodySmall),
                  ],
                );
              }).toList(),
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
