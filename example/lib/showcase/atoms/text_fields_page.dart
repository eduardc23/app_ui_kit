import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

class TextFieldsPage extends StatelessWidget {
  const TextFieldsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(title: const AppText('Text Fields', variant: AppTextVariant.titleLarge)),
      body: ListView(
        padding: AppSpacing.md.all,
        children: const [
          _ShowcaseSection(
            title: 'Default',
            child: AppTextField(
              label: 'Label',
              hint: 'Hint text',
              minLines: 2,
              obscureText: true,
            ),
          ),
          _ShowcaseSection(
            title: 'With Helper Text',
            child: AppTextField(
              label: 'Label',
              helperText: 'Helper text',
            ),
          ),
          _ShowcaseSection(
            title: 'With Error',
            child: AppTextField(
              label: 'Label',
              errorText: 'Error message',
            ),
          ),
          _ShowcaseSection(
            title: 'Disabled',
            child: AppTextField(
              enabled: false,
              label: 'Disabled Field',
              hint: 'You cannot type here',
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
