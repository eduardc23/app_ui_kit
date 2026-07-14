import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

class IconSizesPage extends StatelessWidget {
  const IconSizesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppText('Icon Sizes', variant: AppTextVariant.titleLarge)),
      body: ListView(
        padding: AppSpacing.md.all,
        children: const [
          _ShowcaseSection(
            title: 'Tokens',
            child: Column(
              children: [
                _IconSizeRow(name: 'xs', size: AppIconSize.xs),
                _IconSizeRow(name: 'sm', size: AppIconSize.sm),
                _IconSizeRow(name: 'md', size: AppIconSize.md),
                _IconSizeRow(name: 'lg', size: AppIconSize.lg),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _IconSizeRow extends StatelessWidget {
  final String name;
  final double size;

  const _IconSizeRow({required this.name, required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.xs.vertical,
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: AppIcon(Icons.star, size: size),
          ),
          AppSpacing.md.hGap,
          AppText(name, variant: AppTextVariant.labelLarge),
          const Spacer(),
          AppText('${size.toInt()}px', variant: AppTextVariant.bodySmall),
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
