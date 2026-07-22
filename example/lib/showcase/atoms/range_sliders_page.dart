import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

class RangeSlidersPage extends StatefulWidget {
  const RangeSlidersPage({super.key});

  @override
  State<RangeSlidersPage> createState() => _RangeSlidersPageState();
}

class _RangeSlidersPageState extends State<RangeSlidersPage> {
  RangeValues _values1 = const RangeValues(0.2, 0.8);
  RangeValues _values2 = const RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(title: const AppText('Range Sliders', variant: AppTextVariant.titleLarge)),
      body: ListView(
        padding: AppSpacing.md.all,
        children: [
          _ShowcaseSection(
            title: 'Default Continuous',
            child: AppRangeSlider(
              values: _values1,
              onChanged: (values) => setState(() => _values1 = values),
            ),
          ),
          _ShowcaseSection(
            title: 'Discrete with Divisions',
            child: AppRangeSlider(
              values: _values2,
              min: 0,
              max: 100,
              divisions: 10,
              labelFormatter: (value) => '\$${value.round()}',
              onChanged: (values) => setState(() => _values2 = values),
            ),
          ),
          _ShowcaseSection(
            title: 'Disabled',
            child: AppRangeSlider(
              values: const RangeValues(0.3, 0.7),
              onChanged: null,
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
