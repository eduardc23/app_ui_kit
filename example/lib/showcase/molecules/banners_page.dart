import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

class BannersPage extends StatelessWidget {
  const BannersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppText('Banners & States', variant: AppTextVariant.titleLarge)),
      body: ListView(
        padding: AppSpacing.md.all,
        children: [
          _ShowcaseSection(
            title: 'Empty State',
            child: AppEmptyState(
              icon: Icons.search_off,
              title: 'No results found',
              description: 'Try adjusting your filters or searching for something else.',
              actionLabel: 'Clear Filters',
              onAction: () {},
            ),
          ),
          _ShowcaseSection(
            title: 'Simple Info State',
            child: const AppEmptyState(
              icon: Icons.info_outline,
              title: 'Everything is up to date',
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
