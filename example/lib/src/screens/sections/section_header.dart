import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.md.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(title, variant: AppTextVariant.headlineSmall),
          const Divider(),
        ],
      ),
    );
  }
}
