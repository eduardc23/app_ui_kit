import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Tokens de tipografía del sistema de diseño.
///
/// Define la escala tipográfica global basada en los roles de **Material Design 3**,
/// usando [Inter] como familia tipográfica única — una fuente geométrica y neutral
/// de alta legibilidad, ampliamente usada en productos digitales de escala
/// empresarial (Meta, Linear, Notion).
///
/// ### Escala de roles
///
/// | Token          | Tamaño | Peso    | Uso principal                        |
/// |----------------|--------|---------|--------------------------------------|
/// | [displayLarge] | 57px   | Regular | Números hero, pantallas de splash     |
/// | [displayMedium]| 45px   | Regular | Títulos de marketing, onboarding      |
/// | [displaySmall] | 36px   | Regular | Encabezados de sección prominentes    |
/// | [headlineLarge]| 32px   | SemiBold| Títulos principales de pantalla       |
/// | [headlineMedium]| 28px  | SemiBold| Subtítulos de sección                 |
/// | [headlineSmall]| 24px   | SemiBold| Encabezados de cards o dialogs        |
/// | [titleLarge]   | 22px   | Medium  | AppBar, títulos de lista              |
/// | [titleMedium]  | 16px   | Medium  | Títulos de items, tabs                |
/// | [titleSmall]   | 14px   | Medium  | Etiquetas de sección, subtítulos      |
/// | [bodyLarge]    | 16px   | Regular | Cuerpo principal de texto             |
/// | [bodyMedium]   | 14px   | Regular | Cuerpo secundario, descripciones      |
/// | [bodySmall]    | 12px   | Regular | Texto de soporte, metadatos           |
/// | [labelLarge]   | 14px   | Medium  | Botones, CTAs                         |
/// | [labelMedium]  | 12px   | Medium  | Chips, badges, tabs compactos         |
/// | [labelSmall]   | 11px   | Medium  | Captions, timestamps, anotaciones     |
///
abstract final class AppTypography {
  /// Familia tipográfica base del sistema.
  ///
  /// Se centraliza aquí para que un cambio de fuente
  /// se propague a todos los tokens automáticamente.
  static String get _fontFamily => GoogleFonts.inter().fontFamily!;

  // ─────────────────────────────────────────────
  // Display
  // Uso: números hero, splash screens, marketing.
  // ─────────────────────────────────────────────

  /// **57px · Regular** — El estilo de mayor jerarquía.
  static TextStyle get displayLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 57,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
        height: 1.12,
      );

  /// **45px · Regular** — Títulos de gran escala para
  /// secciones de marketing u onboarding.
  static TextStyle get displayMedium => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 45,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        height: 1.16,
      );

  /// **36px · Regular** — Encabezados prominentes de sección
  /// o títulos en pantallas de contenido editorial.
  static TextStyle get displaySmall => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 36,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        height: 1.22,
      );

  // ─────────────────────────────────────────────
  // Headline
  // Uso: títulos principales de pantalla y sección.
  // ─────────────────────────────────────────────

  /// **32px · SemiBold** — Título principal de una pantalla.
  /// El punto de entrada visual más importante del contenido.
  static TextStyle get headlineLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 32,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.25,
      );

  /// **28px · SemiBold** — Subtítulo de sección o encabezado
  /// secundario dentro de una pantalla.
  static TextStyle get headlineMedium => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.29,
      );

  /// **24px · SemiBold** — Encabezado de cards, dialogs
  /// o bottom sheets.
  static TextStyle get headlineSmall => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.33,
      );

  // ─────────────────────────────────────────────
  // Title
  // Uso: AppBar, tabs, items de lista, navegación.
  // ─────────────────────────────────────────────

  /// **22px · Medium** — Título de AppBar o encabezado
  /// de sección dentro de un scroll.
  static TextStyle get titleLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 22,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
        height: 1.27,
      );

  /// **16px · Medium** — Título de un list tile, tab
  /// o encabezado de grupo.
  static TextStyle get titleMedium => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        height: 1.50,
      );

  /// **14px · Medium** — Etiqueta de sección compacta
  /// o subtítulo de un item.
  static TextStyle get titleSmall => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.10,
        height: 1.43,
      );

  // ─────────────────────────────────────────────
  // Body
  // Uso: contenido principal de lectura.
  // ─────────────────────────────────────────────

  /// **16px · Regular** — Cuerpo principal. Úsalo para
  /// párrafos y contenido de lectura extendida.
  static TextStyle get bodyLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.50,
        height: 1.50,
      );

  /// **14px · Regular** — Cuerpo secundario. Descripciones,
  /// subtextos y contenido de menor jerarquía.
  static TextStyle get bodyMedium => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        height: 1.43,
      );

  /// **12px · Regular** — Texto de soporte. Metadatos,
  /// fechas, textos auxiliares dentro de componentes.
  static TextStyle get bodySmall => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.40,
        height: 1.33,
      );

  // ─────────────────────────────────────────────
  // Label
  // Uso: elementos interactivos y UI compacta.
  // ─────────────────────────────────────────────

  /// **14px · Medium** — Texto de botones y CTAs.
  /// El estilo estándar para elementos accionables.
  static TextStyle get labelLarge => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.10,
        height: 1.43,
      );

  /// **12px · Medium** — Chips, badges y tabs compactos.
  static TextStyle get labelMedium => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.50,
        height: 1.33,
      );

  /// **11px · Medium** — El estilo de menor jerarquía.
  /// Captions, timestamps y anotaciones secundarias.
  static TextStyle get labelSmall => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.50,
        height: 1.45,
      );
}
