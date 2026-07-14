import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppText('Buttons', variant: AppTextVariant.titleLarge)),
      body: ListView(
        padding: AppSpacing.md.all,
        children: [
          _ShowcaseSection(
            title: 'Primary',
            child: Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.sm,
              children: [
                AppButton.primary(
                  label: 'Primary Button',
                  onPressed: () {},
                ),
                AppButton.primary(
                  label: 'Disabled',
                  onPressed: null,
                ),
                AppButton.primary(
                  label: 'Loading',
                  onPressed: () {},
                  isLoading: true,
                ),
              ],
            ),
          ),
          _ShowcaseSection(
            title: 'Secondary',
            child: Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.sm,
              children: [
                AppButton.secondary(
                  label: 'Secondary Button',
                  onPressed: () {},
                ),
                AppButton.secondary(
                  label: 'Disabled',
                  onPressed: null,
                ),
                AppButton.secondary(
                  label: 'Loading',
                  onPressed: () {},
                  isLoading: true,
                ),
              ],
            ),
          ),
          _ShowcaseSection(
            title: 'Expanded',
            child: AppButton.primary(
              label: 'Expanded Button',
              onPressed: () {},
              expanded: true,
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
