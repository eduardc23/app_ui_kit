import 'package:flutter/material.dart';

import '../../design_system/tokens/tokens.dart';
import '../color_scheme/app_color_scheme.dart';

/// Tema de [Chip] del sistema de diseño.
///
/// Configura la apariencia de los elementos de entrada, elección y filtro.
/// Utiliza formas compactas y estados visuales claros para selección y deshabilitado.
abstract final class AppChipTheme {
  static ChipThemeData get light => _build(AppColorScheme.light);

  static ChipThemeData get dark => _build(AppColorScheme.dark);

  static ChipThemeData _build(ColorScheme scheme) {
    return ChipThemeData(
      backgroundColor: scheme.surface,
      selectedColor: scheme.primary,
      disabledColor: scheme.onSurface.withValues(
        alpha: AppOpacity.disabledSurface,
      ),
      labelStyle: AppTypography.labelMedium.copyWith(
        color: WidgetStateColor.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return scheme.onSurface
                .withValues(alpha: AppOpacity.disabledSurface);
          }
          if (states.contains(WidgetState.selected)) {
            return scheme.onPrimary;
          }
          return scheme.onSurface;
        }),
      ),
      iconTheme: IconThemeData(color: scheme.onSurface, size: AppIconSize.sm),
      checkmarkColor: scheme.onPrimary,
      deleteIconColor: scheme.onSurface,
      side: BorderSide(
        color: scheme.outlineVariant,
        width: AppBorder.widthThin,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      labelPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
    );
  }
}
