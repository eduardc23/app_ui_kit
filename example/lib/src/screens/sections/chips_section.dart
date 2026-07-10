import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'section_header.dart';

class ChipsSection extends StatefulWidget {
  const ChipsSection({super.key});

  @override
  State<ChipsSection> createState() => _ChipsSectionState();
}

class _ChipsSectionState extends State<ChipsSection> {
  final Set<String> _selectedCategories = {};
  final Set<String> _selectedGenres = {};

  void _toggleCategory(String label, bool selected) {
    setState(() {
      if (selected) {
        _selectedCategories.add(label);
      } else {
        _selectedCategories.remove(label);
      }
    });
  }

  void _toggleGenre(String label, bool selected) {
    setState(() {
      if (selected) {
        _selectedGenres.add(label);
      } else {
        _selectedGenres.remove(label);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Chips'),
        const AppText('Chips de filtro', variant: AppTextVariant.labelLarge),
        const SizedBox(height: AppSpacing.xs),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            for (final category in ['Tecnología', 'Ciencia', 'Diseño', 'Negocios'])
              AppChip.filter(
                label: category,
                selected: _selectedCategories.contains(category),
                onSelected: (val) => _toggleCategory(category, val),
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        const AppText('Chips de entrada', variant: AppTextVariant.labelLarge),
        const SizedBox(height: AppSpacing.xs),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            for (final genre in [
              ('🎶', 'Música'),
              ('🎬', 'Cine'),
              ('📚', 'Libros'),
              ('🎮', 'Juegos'),
            ])
              AppChip.input(
                label: genre.$2,
                avatar: Text(genre.$1),
                selected: _selectedGenres.contains(genre.$2),
                onSelected: (val) => _toggleGenre(genre.$2, val),
              ),
          ],
        ),
      ],
    );
  }
}
