import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppText('Typography', variant: AppTextVariant.titleLarge)),
      body: ListView(
        padding: AppSpacing.md.all,
        children: const [
          _ShowcaseSection(
            title: 'Display',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText('Display Large', variant: AppTextVariant.displayLarge),
                AppText('Display Medium', variant: AppTextVariant.displayMedium),
                AppText('Display Small', variant: AppTextVariant.displaySmall),
              ],
            ),
          ),
          _ShowcaseSection(
            title: 'Headline',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText('Headline Large', variant: AppTextVariant.headlineLarge),
                AppText('Headline Medium', variant: AppTextVariant.headlineMedium),
                AppText('Headline Small', variant: AppTextVariant.headlineSmall),
              ],
            ),
          ),
          _ShowcaseSection(
            title: 'Title',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText('Title Large', variant: AppTextVariant.titleLarge),
                AppText('Title Medium', variant: AppTextVariant.titleMedium),
                AppText('Title Small', variant: AppTextVariant.titleSmall),
              ],
            ),
          ),
          _ShowcaseSection(
            title: 'Body',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText('Body Large', variant: AppTextVariant.bodyLarge),
                AppText('Body Medium', variant: AppTextVariant.bodyMedium),
                AppText('Body Small', variant: AppTextVariant.bodySmall),
              ],
            ),
          ),
          _ShowcaseSection(
            title: 'Label',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText('Label Large', variant: AppTextVariant.labelLarge),
                AppText('Label Medium', variant: AppTextVariant.labelMedium),
                AppText('Label Small', variant: AppTextVariant.labelSmall),
              ],
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
          variant: AppTextVariant.titleSmall,
          color: Theme.of(context).colorScheme.primary,
        ),
        const Divider(),
        AppSpacing.sm.vGap,
        child,
        AppSpacing.xxl.vGap,
      ],
    );
  }
}
