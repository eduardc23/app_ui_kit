import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

class IconsPage extends StatelessWidget {
  const IconsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(title: const AppText('Icons', variant: AppTextVariant.titleLarge)),
      body: ListView(
        padding: AppSpacing.md.all,
        children: [
          _ShowcaseSection(
            title: 'Sizes',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const AppIcon(Icons.home, size: AppIconSize.xs),
                    AppSpacing.xxs.vGap,
                    const AppText('xs', variant: AppTextVariant.labelSmall),
                  ],
                ),
                Column(
                  children: [
                    const AppIcon(Icons.home, size: AppIconSize.sm),
                    AppSpacing.xxs.vGap,
                    const AppText('sm', variant: AppTextVariant.labelSmall),
                  ],
                ),
                Column(
                  children: [
                    const AppIcon(Icons.home, size: AppIconSize.md),
                    AppSpacing.xxs.vGap,
                    const AppText('md', variant: AppTextVariant.labelSmall),
                  ],
                ),
                Column(
                  children: [
                    const AppIcon(Icons.home, size: AppIconSize.lg),
                    AppSpacing.xxs.vGap,
                    const AppText('lg', variant: AppTextVariant.labelSmall),
                  ],
                ),
              ],
            ),
          ),
          const _ShowcaseSection(
            title: 'Colors',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppIcon(Icons.favorite, color: Colors.red),
                AppIcon(Icons.verified, color: Colors.blue),
                AppIcon(Icons.warning, color: Colors.amber),
              ],
            ),
          ),
          _ShowcaseSection(
            title: 'As Button',
            child: Center(
              child: AppIcon(
                Icons.add_a_photo,
                onPressed: () {},
                semanticLabel: 'Take photo',
              ),
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
