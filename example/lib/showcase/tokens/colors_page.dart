import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const AppText('Colors', variant: AppTextVariant.titleLarge),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Primitives'),
              Tab(text: 'Semantic Scheme'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _PrimitivesTab(),
            _SemanticTab(),
          ],
        ),
      ),
    );
  }
}

class _PrimitivesTab extends StatelessWidget {
  const _PrimitivesTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppSpacing.md.all,
      children: const [
        _ShowcaseSection(
          title: 'Blue Palette (Primary Source)',
          child: Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: [
              _ColorCard(color: AppColors.blue100, name: 'blue100'),
              _ColorCard(color: AppColors.blue200, name: 'blue200'),
              _ColorCard(color: AppColors.blue400, name: 'blue400'),
              _ColorCard(color: AppColors.blue500, name: 'blue500'),
              _ColorCard(color: AppColors.blue600, name: 'blue600'),
              _ColorCard(color: AppColors.blue700, name: 'blue700'),
            ],
          ),
        ),
        _ShowcaseSection(
          title: 'Powder Palette (Tertiary Source)',
          child: Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: [
              _ColorCard(color: AppColors.powder50, name: 'powder50'),
              _ColorCard(color: AppColors.powder100, name: 'powder100'),
              _ColorCard(color: AppColors.powder200, name: 'powder200'),
              _ColorCard(color: AppColors.powder300, name: 'powder300'),
              _ColorCard(color: AppColors.powder400, name: 'powder400'),
            ],
          ),
        ),
        _ShowcaseSection(
          title: 'Red Palette (Error Source)',
          child: Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: [
              _ColorCard(color: AppColors.red100, name: 'red100'),
              _ColorCard(color: AppColors.red200, name: 'red200'),
              _ColorCard(color: AppColors.red600, name: 'red600'),
              _ColorCard(color: AppColors.red900, name: 'red900'),
            ],
          ),
        ),
        _ShowcaseSection(
          title: 'Neutral Palette (Surfaces & Content)',
          child: Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: [
              _ColorCard(color: AppColors.neutral50, name: 'neutral50'),
              _ColorCard(color: AppColors.neutral100, name: 'neutral100'),
              _ColorCard(color: AppColors.neutral150, name: 'neutral150'),
              _ColorCard(color: AppColors.neutral200, name: 'neutral200'),
              _ColorCard(color: AppColors.neutral300, name: 'neutral300'),
              _ColorCard(color: AppColors.neutral400, name: 'neutral400'),
              _ColorCard(color: AppColors.neutral500, name: 'neutral500'),
              _ColorCard(color: AppColors.neutral600, name: 'neutral600'),
              _ColorCard(color: AppColors.neutral700, name: 'neutral700'),
              _ColorCard(color: AppColors.neutral800, name: 'neutral800'),
              _ColorCard(color: AppColors.neutral850, name: 'neutral850'),
              _ColorCard(color: AppColors.neutral900, name: 'neutral900'),
            ],
          ),
        ),
        _ShowcaseSection(
          title: 'Dark Palette (Dark Mode Specific)',
          child: Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: [
              _ColorCard(color: AppColors.dark50, name: 'dark50'),
              _ColorCard(color: AppColors.dark100, name: 'dark100'),
              _ColorCard(color: AppColors.dark200, name: 'dark200'),
              _ColorCard(color: AppColors.dark300, name: 'dark300'),
              _ColorCard(color: AppColors.dark400, name: 'dark400'),
              _ColorCard(color: AppColors.dark500, name: 'dark500'),
            ],
          ),
        ),
        _ShowcaseSection(
          title: 'Gray',
          child: Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: [
              _ColorCard(color: AppColors.gray50, name: 'gray50'),
              _ColorCard(color: AppColors.gray100, name: 'gray100'),
              _ColorCard(color: AppColors.gray200, name: 'gray200'),
              _ColorCard(color: AppColors.white, name: 'white'),
              _ColorCard(color: AppColors.black, name: 'black'),
            ],
          ),
        ),
      ],
    );
  }
}

class _SemanticTab extends StatelessWidget {
  const _SemanticTab();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ListView(
      padding: AppSpacing.md.all,
      children: [
        _ShowcaseSection(
          title: 'Core (${isDark ? "Dark" : "Light"} Active)',
          child: Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              _ColorCard(color: scheme.primary, name: 'primary'),
              _ColorCard(color: scheme.onPrimary, name: 'onPrimary'),
              _ColorCard(color: scheme.primaryContainer, name: 'primaryContainer'),
              _ColorCard(color: scheme.secondary, name: 'secondary'),
              _ColorCard(color: scheme.onSecondary, name: 'onSecondary'),
              _ColorCard(color: scheme.tertiary, name: 'tertiary'),
              _ColorCard(color: scheme.error, name: 'error'),
            ],
          ),
        ),
        _ShowcaseSection(
          title: 'Surface & Outline',
          child: Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              _ColorCard(color: scheme.surface, name: 'surface'),
              _ColorCard(color: scheme.onSurface, name: 'onSurface'),
              _ColorCard(color: scheme.onSurfaceVariant, name: 'onSurfaceVariant'),
              _ColorCard(color: scheme.outline, name: 'outline'),
              _ColorCard(color: scheme.outlineVariant, name: 'outlineVariant'),
            ],
          ),
        ),
        _ShowcaseSection(
          title: 'Surface Containers',
          child: Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              _ColorCard(color: scheme.surfaceContainerHighest, name: 'highest'),
              _ColorCard(color: scheme.surfaceContainerHigh, name: 'high'),
              _ColorCard(color: scheme.surfaceContainer, name: 'default'),
              _ColorCard(color: scheme.surfaceContainerLow, name: 'low'),
              _ColorCard(color: scheme.surfaceContainerLowest, name: 'lowest'),
            ],
          ),
        ),
      ],
    );
  }
}

class _ColorCard extends StatelessWidget {
  final Color color;
  final String name;

  const _ColorCard({required this.color, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
          ),
          child: Center(
            child: AppText(
              'Aa',
              variant: AppTextVariant.titleMedium,
              color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
            ),
          ),
        ),
        AppSpacing.xxs.vGap,
        SizedBox(
          width: 90,
          child: AppText(
            name,
            variant: AppTextVariant.labelSmall,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
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
        const Divider(),
        AppSpacing.sm.vGap,
        child,
        AppSpacing.xxl.vGap,
      ],
    );
  }
}
