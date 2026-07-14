import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

class ShadowsPage extends StatelessWidget {
  const ShadowsPage({super.key});

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

    return Scaffold(
      appBar: AppBar(title: const AppText('Shadows', variant: AppTextVariant.titleLarge)),
      body: ListView(
        padding: AppSpacing.md.all,
        children: [
          _ShowcaseSection(
            title: 'Elevation Tokens',
            child: Wrap(
              spacing: AppSpacing.xxl,
              runSpacing: AppSpacing.xxl,
              children: elevations.entries.map((e) {
                return Column(
                  children: [
                    AppCard(
                      elevation: e.value,
                      padding: EdgeInsets.zero,
                      child: Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        child: AppText(e.key, variant: AppTextVariant.labelSmall),
                      ),
                    ),
                    AppSpacing.sm.vGap,
                    AppText('Level ${elevations.keys.toList().indexOf(e.key)}', variant: AppTextVariant.bodySmall),
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
