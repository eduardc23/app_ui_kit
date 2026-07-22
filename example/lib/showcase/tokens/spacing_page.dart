import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

class SpacingPage extends StatelessWidget {
  const SpacingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(title: const AppText('Spacing', variant: AppTextVariant.titleLarge)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _SpacingRow(name: 'xxxs', value: AppSpacing.xxxs),
          _SpacingRow(name: 'xxs', value: AppSpacing.xxs),
          _SpacingRow(name: 'xs', value: AppSpacing.xs),
          _SpacingRow(name: 'sm', value: AppSpacing.sm),
          _SpacingRow(name: 'md', value: AppSpacing.md),
          _SpacingRow(name: 'lg', value: AppSpacing.lg),
          _SpacingRow(name: 'xl', value: AppSpacing.xl),
          _SpacingRow(name: 'xxl', value: AppSpacing.xxl),
          _SpacingRow(name: 'xxxl', value: AppSpacing.xxxl),
          _SpacingRow(name: 'xl4', value: AppSpacing.xl4),
          _SpacingRow(name: 'xl5', value: AppSpacing.xl5),
          _SpacingRow(name: 'xl6', value: AppSpacing.xl6),
        ],
      ),
    );
  }
}

class _SpacingRow extends StatelessWidget {
  final String name;
  final double value;

  const _SpacingRow({required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: AppText(name, variant: AppTextVariant.labelLarge),
          ),
          AppText('${value.toInt()}px', variant: AppTextVariant.bodySmall),
          AppSpacing.md.vGap,
          Expanded(
            child: Container(
              height: 24,
              width: value,
              alignment: Alignment.centerLeft,
              child: Container(
                width: value,
                color: context.colorScheme.primary.withValues(alpha: 0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
