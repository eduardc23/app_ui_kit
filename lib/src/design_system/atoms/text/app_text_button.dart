import 'package:flutter/material.dart';

import 'app_text.dart';
import 'app_text_variant.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    required this.onPressed,
    required this.label,
    required this.variant,
    this.padding,
    this.color,
    super.key,
  });

  final VoidCallback? onPressed;
  final String label;
  final AppTextVariant variant;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: padding != null
          ? TextButton.styleFrom(padding: padding)
          : null,
      child: AppText(label, variant: variant, color: color),
    );
  }
}
