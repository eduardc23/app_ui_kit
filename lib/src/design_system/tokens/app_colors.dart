import 'package:flutter/material.dart';

/// Valores de color crudos, agrupados por familia.
/// Son la fuente de verdad de toda la paleta del design system.
abstract final class AppColors {
  // ── Blue ── (familia de color primario) ────────────────────────────────────

  /// Azul cielo claro. primaryContainer (light) · primaryFixed.
  static const Color blue100 = Color(0xFF50BFFF);

  /// primaryFixedDim.
  static const Color blue200 = Color(0xFF3CABFF);

  ///Brand primary. [ColorScheme.primary] en modo claro · inversePrimary oscuro.
  static const Color blue400 = Color(0xFF006FFD);

  /// [ColorScheme.primary] en modo oscuro · inversePrimary claro.
  static const Color blue500 = Color(0xFF005BE9);

  /// onPrimaryContainer en modo claro.
  static const Color blue600 = Color(0xFF0047D5);

  /// primaryContainer en modo oscuro · onPrimaryFixed.
  static const Color blue700 = Color(0xFF0033C1);

  // ── Gray ── (familia de color secundario — basada en blanco) ───────────────
  // El secundario de esta paleta es un blanco/gris suave, lo que crea
  // un fuerte contraste de saturación contra el azul primario.

  /// Gris muy claro. [ColorScheme.secondary] en modo oscuro.
  static const Color gray50 = Color(0xFFEBEBEB);

  /// onSecondaryContainer en modo claro.
  static const Color gray100 = Color(0xFFD7D7D7);

  /// secondaryContainer en modo oscuro · onSecondaryFixed.
  static const Color gray200 = Color(0xFFC3C3C3);

  // ── Powder ── (familia de color terciario — azul pastel) ───────────────────

  /// Blanco con tinte cian muy sutil. tertiaryFixedDim.
  static const Color powder50 = Color(0xFFEFFFFF);

  /// ★ Azul pastel principal. [ColorScheme.tertiary] en modo claro.
  static const Color powder100 = Color(0xFFB3DAFF);

  /// [ColorScheme.tertiary] en modo oscuro · onTertiaryFixedVariant.
  static const Color powder200 = Color(0xFF9FC6EB);

  /// onTertiaryContainer en modo claro.
  static const Color powder300 = Color(0xFF8BB2D7);

  /// tertiaryContainer en modo oscuro · onTertiaryFixed.
  static const Color powder400 = Color(0xFF779EC3);

  // ── Red ── (familia de estados de error) ───────────────────────────────────

  /// errorContainer en modo claro.
  static const Color red100 = Color(0xFFFFDAD6);

  /// [ColorScheme.error] en modo oscuro.
  static const Color red200 = Color(0xFFFFB4AB);

  /// [ColorScheme.error] en modo claro.
  static const Color red600 = Color(0xFFBA1A1A);

  /// errorContainer oscuro · onErrorContainer claro.
  static const Color red900 = Color(0xFF93000A);

  // ── Neutral ── (superficies y contenido — rango claro) ─────────────────────

  /// [ColorScheme.surface] · surfaceBright en modo claro.
  static const Color neutral50 = Color(0xFFFFFBFE);

  /// surfaceContainerLow en modo claro.
  static const Color neutral100 = Color(0xFFF7F2FA);

  /// onInverseSurface en modo claro.
  static const Color neutral150 = Color(0xFFF4EFF4);

  /// surfaceContainer en modo claro.
  static const Color neutral200 = Color(0xFFF3EDF7);

  /// surfaceContainerHigh en modo claro.
  static const Color neutral300 = Color(0xFFECE6F0);

  /// surfaceContainerHighest · surfaceDim claro · inverseSurface oscuro.
  static const Color neutral400 = Color(0xFFE6E0E9);

  /// outlineVariant claro · onSurfaceVariant oscuro.
  static const Color neutral500 = Color(0xFFCAC4D0);

  /// outline en modo oscuro.
  static const Color neutral600 = Color(0xFF938F99);

  /// outline en modo claro.
  static const Color neutral700 = Color(0xFF79747E);

  /// onSurfaceVariant claro · outlineVariant oscuro.
  static const Color neutral800 = Color(0xFF49454F);

  /// inverseSurface claro · onInverseSurface oscuro.
  static const Color neutral850 = Color(0xFF313033);

  /// [ColorScheme.onSurface] en modo claro.
  static const Color neutral900 = Color(0xFF1C1B1F);

  // ── Dark surface ── (superficies y contenido — rango oscuro) ───────────────

  /// surfaceBright · surfaceContainerHighest en modo oscuro.
  static const Color dark50 = Color(0xFF362F33);

  /// surfaceContainerHigh en modo oscuro.
  static const Color dark100 = Color(0xFF2B2329);

  /// surfaceContainer en modo oscuro.
  static const Color dark200 = Color(0xFF211A1E);

  /// surfaceContainerLow en modo oscuro.
  static const Color dark300 = Color(0xFF1D1418);

  /// [ColorScheme.surface] · surfaceDim en modo oscuro.
  static const Color dark400 = Color(0xFF10090D);

  /// surfaceContainerLowest en modo oscuro.
  static const Color dark500 = Color(0xFF0B0509);

  // ── Absolute ──────────────────────────────────────────────────────────────

  /// Blanco puro. Usado en secondary (light), onPrimary, onError, y contenedores.
  static const Color white = Color(0xFFFFFFFF);

  /// Negro puro. shadow, scrim, y tokens `on-` sobre colores vibrantes.
  static const Color black = Color(0xFF000000);

  // ── Green ── (success)
  static const Color green100 = Color(0xFFDCFCE7);
  static const Color green400 = Color(0xFF16A34A);
  static const Color green700 = Color(0xFF14532D);
  static const Color green200 = Color(0xFFBBF7D0);

  // ── Amber ── (warning)
  static const Color amber100 = Color(0xFFFEF9C3);
  static const Color amber400 = Color(0xFFCA8A04);
  static const Color amber700 = Color(0xFF713F12);
  static const Color amber200 = Color(0xFFFDE68A);
}
