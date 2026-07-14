import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

class ChipsPage extends StatefulWidget {
  const ChipsPage({super.key});

  @override
  State<ChipsPage> createState() => _ChipsPageState();
}

class _ChipsPageState extends State<ChipsPage> {
  bool _filterSelected = false;
  bool _inputSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppText('Chips', variant: AppTextVariant.titleLarge)),
      body: ListView(
        padding: AppSpacing.md.all,
        children: [
          _ShowcaseSection(
            title: 'Filter Chip',
            child: Wrap(
              spacing: AppSpacing.xs,
              children: [
                AppChip.filter(
                  label: 'Filter',
                  selected: _filterSelected,
                  onSelected: (value) => setState(() => _filterSelected = value),
                ),
                AppChip.filter(
                  label: 'Selected',
                  selected: true,
                  onSelected: (_) {},
                ),
              ],
            ),
          ),
          _ShowcaseSection(
            title: 'Input Chip',
            child: Wrap(
              spacing: AppSpacing.xs,
              children: [
                AppChip.input(
                  label: 'Music',
                  avatar: const AppIcon(Icons.music_note, size: AppIconSize.sm),
                  selected: _inputSelected,
                  onSelected: (value) => setState(() => _inputSelected = value),
                ),
                AppChip.input(
                  label: 'Selected',
                  avatar: const AppIcon(Icons.star, size: AppIconSize.sm),
                  selected: true,
                  onSelected: (_) {},
                ),
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
          variant: AppTextVariant.titleMedium,
        ),
        AppSpacing.sm.vGap,
        child,
        AppSpacing.xxl.vGap,
      ],
    );
  }
}
