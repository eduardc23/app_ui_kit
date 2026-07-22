import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'tokens/colors_page.dart';
import 'tokens/typography_page.dart';
import 'tokens/spacing_page.dart';
import 'tokens/radius_page.dart';
import 'tokens/shadows_page.dart';
import 'tokens/borders_page.dart';
import 'tokens/icon_sizes_page.dart';
import 'atoms/buttons_page.dart';
import 'atoms/text_fields_page.dart';
import 'atoms/chips_page.dart';
import 'atoms/loaders_page.dart';
import 'atoms/cards_page.dart';
import 'atoms/icons_page.dart';
import 'atoms/range_sliders_page.dart';
import 'atoms/text_page.dart';
import 'atoms/images_page.dart';
import 'molecules/cards_page.dart';
import 'molecules/banners_page.dart';
import 'molecules/forms_page.dart';
import 'templates/scaffolds_page.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final ThemeMode currentMode;

  const HomePage({
    super.key,
    required this.onToggleTheme,
    required this.currentMode,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const AppText('UI Kit Showcase',
            variant: AppTextVariant.titleLarge),
        actions: [
          IconButton(
            icon: AppIcon(currentMode == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode),
            onPressed: onToggleTheme,
          ),
        ],
      ),
      body: ListView(
        children: [
          const _CategoryHeader(title: 'Tokens'),
          _ShowcaseTile(
            title: 'Colors',
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const ColorsPage())),
          ),
          _ShowcaseTile(
            title: 'Typography',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const TypographyPage())),
          ),
          _ShowcaseTile(
            title: 'Spacing',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SpacingPage())),
          ),
          _ShowcaseTile(
            title: 'Radius',
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const RadiusPage())),
          ),
          _ShowcaseTile(
            title: 'Shadows',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ShadowsPage())),
          ),
          _ShowcaseTile(
            title: 'Borders',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const BordersPage())),
          ),
          _ShowcaseTile(
            title: 'Icon Sizes',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const IconSizesPage())),
          ),
          const _CategoryHeader(title: 'Atoms'),
          _ShowcaseTile(
            title: 'Buttons',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ButtonsPage())),
          ),
          _ShowcaseTile(
            title: 'Text Fields',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const TextFieldsPage())),
          ),
          _ShowcaseTile(
            title: 'Chips',
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const ChipsPage())),
          ),
          _ShowcaseTile(
            title: 'Loaders',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const LoadersPage())),
          ),
          _ShowcaseTile(
            title: 'Cards (Base)',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const AppCardsPage())),
          ),
          _ShowcaseTile(
            title: 'Icons',
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const IconsPage())),
          ),
          _ShowcaseTile(
            title: 'Range Sliders',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const RangeSlidersPage())),
          ),
          _ShowcaseTile(
            title: 'Text',
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const TextPage())),
          ),
          _ShowcaseTile(
            title: 'Images',
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const ImagesPage())),
          ),
          const _CategoryHeader(title: 'Molecules'),
          _ShowcaseTile(
            title: 'Event Cards',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const EventCardsPage())),
          ),
          _ShowcaseTile(
            title: 'Banners & States',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const BannersPage())),
          ),
          _ShowcaseTile(
            title: 'Registration Form',
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const FormsPage())),
          ),
          const _CategoryHeader(title: 'Templates'),
          _ShowcaseTile(
            title: 'App Scaffold',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ScaffoldsPage())),
          ),
        ],
      ),
    );
  }
}

class _CategoryHeader extends StatelessWidget {
  final String title;

  const _CategoryHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.xl,
        AppSpacing.md,
        AppSpacing.xs,
      ),
      child: AppText(
        title,
        variant: AppTextVariant.titleLarge,
        color: context.colorScheme.primary,
      ),
    );
  }
}

class _ShowcaseTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _ShowcaseTile({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AppText(title, variant: AppTextVariant.bodyLarge),
      trailing: const AppIcon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
