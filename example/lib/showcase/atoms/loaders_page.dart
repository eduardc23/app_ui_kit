import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

class LoadersPage extends StatelessWidget {
  const LoadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppText('Loaders', variant: AppTextVariant.titleLarge)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _ShowcaseSection(
            title: 'Small',
            child: AppLoader.small(),
          ),
          _ShowcaseSection(
            title: 'Medium',
            child: AppLoader.medium(),
          ),
          _ShowcaseSection(
            title: 'Custom Color',
            child: AppLoader.medium(color: Colors.orange),
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
