import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

class AppCardsPage extends StatelessWidget {
  const AppCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppText('Cards (Atom)', variant: AppTextVariant.titleLarge)),
      body: ListView(
        padding: AppSpacing.md.all,
        children: [
          const _ShowcaseSection(
            title: 'Basic Card',
            child: AppCard(
              child: AppText('This is a basic AppCard with default padding and elevation.', variant: AppTextVariant.bodyMedium),
            ),
          ),
          const _ShowcaseSection(
            title: 'With Elevation',
            child: AppCard(
              elevation: AppElevation.md,
              child: AppText('Card with medium elevation.', variant: AppTextVariant.bodyMedium),
            ),
          ),
          _ShowcaseSection(
            title: 'Custom Color & Radius',
            child: AppCard(
              color: AppColors.blue100.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(AppRadius.xl),
              child: const AppText('Card with custom color and extra large radius.', variant: AppTextVariant.bodyMedium),
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
