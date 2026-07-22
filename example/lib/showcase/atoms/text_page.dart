import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(title: const AppText('Text (Atom)', variant: AppTextVariant.titleLarge)),
      body: ListView(
        padding: AppSpacing.md.all,
        children: [
          _ShowcaseSection(
            title: 'Alignments',
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: AppText(
                    'Left Aligned Text',
                    variant: AppTextVariant.bodyMedium,
                    textAlign: TextAlign.left,
                  ),
                ),
                AppSpacing.sm.vGap,
                SizedBox(
                  width: double.infinity,
                  child: AppText(
                    'Center Aligned Text',
                    variant: AppTextVariant.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                AppSpacing.sm.vGap,
                SizedBox(
                  width: double.infinity,
                  child: AppText(
                    'Right Aligned Text',
                    variant: AppTextVariant.bodyMedium,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
          _ShowcaseSection(
            title: 'Overflow (Ellipsis)',
            child: Container(
              width: 200,
              padding: AppSpacing.xs.all,
              color: context.colorScheme.surfaceContainerHighest,
              child: const AppText(
                'This is a very long text that will not fit in the container and should show ellipsis',
                variant: AppTextVariant.bodyMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
          _ShowcaseSection(
            title: 'Max Lines (2 Lines)',
            child: Container(
              width: 200,
              padding: AppSpacing.xs.all,
              color: context.colorScheme.surfaceContainerHighest,
              child: const AppText(
                'This is a very long text that should be limited to exactly two lines of content.',
                variant: AppTextVariant.bodyMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const _ShowcaseSection(
            title: 'Soft Wrap (Disabled)',
            child: SizedBox(
              width: 150,
              child: AppText(
                'This text has soft wrap disabled so it will continue horizontally.',
                variant: AppTextVariant.bodyMedium,
                softWrap: false,
              ),
            ),
          ),
          const _ShowcaseSection(
            title: 'Custom Color',
            child: AppText(
              'This is a colored text',
              variant: AppTextVariant.titleMedium,
              color: Colors.blueAccent,
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
