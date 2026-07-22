import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

class ScaffoldsPage extends StatelessWidget {
  const ScaffoldsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const AppText('AppScaffold Showcase', variant: AppTextVariant.titleLarge),
      ),
      body: ListView(
        padding: AppSpacing.md.all,
        children: [
          _VariantTile(
            title: 'Standard with AppBar',
            subtitle: 'Uses default background and manages SafeArea',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const _StandardScaffold()),
            ),
          ),
          _VariantTile(
            title: 'No AppBar (Auto Top SafeArea)',
            subtitle: 'Automatically adds padding for the status bar',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const _NoAppBarScaffold()),
            ),
          ),
          _VariantTile(
            title: 'With Bottom Navigation & FAB',
            subtitle: 'Consistent layout with interactive elements',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const _FullFeaturesScaffold()),
            ),
          ),
          _VariantTile(
            title: 'Custom Background',
            subtitle: 'Overriding the default surface color',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const _CustomBackgroundScaffold()),
            ),
          ),
        ],
      ),
    );
  }
}

class _VariantTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _VariantTile({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: AppSpacing.xs.vertical,
      child: ListTile(
        title: AppText(title, variant: AppTextVariant.titleMedium),
        subtitle: AppText(subtitle, variant: AppTextVariant.bodySmall),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

class _StandardScaffold extends StatelessWidget {
  const _StandardScaffold();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const AppText('Standard', variant: AppTextVariant.titleLarge),
      ),
      body: const Center(
        child: AppText('Content under AppBar', variant: AppTextVariant.bodyMedium),
      ),
    );
  }
}

class _NoAppBarScaffold extends StatelessWidget {
  const _NoAppBarScaffold();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: AppSpacing.md.all,
            color: context.colorScheme.primaryContainer,
            child: const AppText(
              'This content is automatically protected by SafeArea top because there is no AppBar.',
              variant: AppTextVariant.bodyMedium,
            ),
          ),
          const Expanded(
            child: Center(
              child: AppText('Body Content', variant: AppTextVariant.bodyMedium),
            ),
          ),
          AppButton.primary(
            label: 'Back',
            onPressed: () => Navigator.pop(context),
          ),
          AppSpacing.md.vGap,
        ],
      ),
    );
  }
}

class _FullFeaturesScaffold extends StatelessWidget {
  const _FullFeaturesScaffold();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const AppText('Full Features', variant: AppTextVariant.titleLarge),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      drawer: const Drawer(child: Center(child: Text('Drawer'))),
      body: const Center(
        child: AppText('Everything together', variant: AppTextVariant.bodyMedium),
      ),
    );
  }
}

class _CustomBackgroundScaffold extends StatelessWidget {
  const _CustomBackgroundScaffold();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const AppText('Custom Color', variant: AppTextVariant.titleLarge),
      ),
      backgroundColor: context.colorScheme.tertiaryContainer.withValues(alpha: 0.2),
      body: const Center(
        child: AppText('Customized background color', variant: AppTextVariant.bodyMedium),
      ),
    );
  }
}
