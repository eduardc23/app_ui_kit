import 'package:flutter/material.dart';

/// Extensiones de espaciado sobre [double].
///
/// Permiten usar los tokens de [AppSpacing] de forma expresiva y fluida,
/// sin necesidad de instanciar [SizedBox] o [EdgeInsets] manualmente.
///
/// ### Uso
/// ```dart
/// // Gaps en Column/Row
/// AppSpacing.md.vGap
/// AppSpacing.xs.hGap
///
/// // Padding / Margin
/// AppSpacing.md.all
/// AppSpacing.lg.horizontal
/// AppSpacing.sm.vertical
/// AppSpacing.top
/// AppSpacing.bottom
/// AppSpacing.left
/// AppSpacing.right
/// ```
extension SpacingX on double {
  /// Espacio vertical — equivalente a `SizedBox(height: value)`.
  ///
  /// Úsalo para separar elementos dentro de una [Column].
  ///
  /// ```dart
  /// Column(
  ///   children: [
  ///     AppText('Título', variant: AppTextVariant.titleLarge),
  ///     AppSpacing.sm.vGap,
  ///     AppText('Subtítulo', variant: AppTextVariant.bodyMedium),
  ///   ],
  /// )
  /// ```
  SizedBox get vGap => SizedBox(height: this);

  /// Espacio horizontal — equivalente a `SizedBox(width: value)`.
  ///
  /// Úsalo para separar elementos dentro de una [Row].
  ///
  /// ```dart
  /// Row(
  ///   children: [
  ///     AppIcon(Icons.star),
  ///     AppSpacing.xs.hGap,
  ///     AppText('Favorito', variant: AppTextVariant.bodyMedium),
  ///   ],
  /// )
  /// ```
  SizedBox get hGap => SizedBox(width: this);

  /// Padding uniforme en los cuatro lados — equivalente a `EdgeInsets.all(value)`.
  ///
  /// ```dart
  /// Padding(
  ///   padding: AppSpacing.md.all,
  ///   child: AppText('Contenido', variant: AppTextVariant.bodyMedium),
  /// )
  /// ```
  EdgeInsets get all => EdgeInsets.all(this);

  /// Padding simétrico horizontal — equivalente a
  /// `EdgeInsets.symmetric(horizontal: value)`.
  ///
  /// ```dart
  /// Padding(
  ///   padding: AppSpacing.lg.horizontal,
  ///   child: AppText('Contenido', variant: AppTextVariant.bodyMedium),
  /// )
  /// ```
  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: this);

  /// Padding simétrico vertical — equivalente a
  /// `EdgeInsets.symmetric(vertical: value)`.
  ///
  /// ```dart
  /// Padding(
  ///   padding: AppSpacing.sm.vertical,
  ///   child: AppText('Contenido', variant: AppTextVariant.bodyMedium),
  /// )
  /// ```
  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: this);

  /// Padding solo en el borde superior — equivalente a
  /// `EdgeInsets.only(top: value)`.
  EdgeInsets get top => EdgeInsets.only(top: this);

  /// Padding solo en el borde inferior — equivalente a
  /// `EdgeInsets.only(bottom: value)`.
  EdgeInsets get bottom => EdgeInsets.only(bottom: this);

  /// Padding solo en el borde izquierdo — equivalente a
  /// `EdgeInsets.only(left: value)`.
  EdgeInsets get left => EdgeInsets.only(left: this);

  /// Padding solo en el borde derecho — equivalente a
  /// `EdgeInsets.only(right: value)`.
  EdgeInsets get right => EdgeInsets.only(right: this);
}