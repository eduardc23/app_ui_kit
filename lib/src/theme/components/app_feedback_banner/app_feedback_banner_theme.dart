import 'package:flutter/material.dart';


class AppFeedbackBannerTheme extends ThemeExtension<AppFeedbackBannerTheme> {
  const AppFeedbackBannerTheme({
    required this.errorBackground,
    required this.errorBorder,
    required this.errorForeground,
    required this.successBackground,
    required this.successBorder,
    required this.successForeground,
    required this.warningBackground,
    required this.warningBorder,
    required this.warningForeground,
    required this.infoBackground,
    required this.infoBorder,
    required this.infoForeground,
  });

  final Color errorBackground;
  final Color errorBorder;
  final Color errorForeground;

  final Color successBackground;
  final Color successBorder;
  final Color successForeground;

  final Color warningBackground;
  final Color warningBorder;
  final Color warningForeground;

  final Color infoBackground;
  final Color infoBorder;
  final Color infoForeground;


  @override
  AppFeedbackBannerTheme copyWith({
    Color? errorBackground,
    Color? errorBorder,
    Color? errorForeground,
    Color? successBackground,
    Color? successBorder,
    Color? successForeground,
    Color? warningBackground,
    Color? warningBorder,
    Color? warningForeground,
    Color? infoBackground,
    Color? infoBorder,
    Color? infoForeground,
  }) {
    return AppFeedbackBannerTheme(
      errorBackground: errorBackground ?? this.errorBackground,
      errorBorder: errorBorder ?? this.errorBorder,
      errorForeground: errorForeground ?? this.errorForeground,
      successBackground: successBackground ?? this.successBackground,
      successBorder: successBorder ?? this.successBorder,
      successForeground: successForeground ?? this.successForeground,
      warningBackground: warningBackground ?? this.warningBackground,
      warningBorder: warningBorder ?? this.warningBorder,
      warningForeground: warningForeground ?? this.warningForeground,
      infoBackground: infoBackground ?? this.infoBackground,
      infoBorder: infoBorder ?? this.infoBorder,
      infoForeground: infoForeground ?? this.infoForeground,
    );
  }

  @override
  AppFeedbackBannerTheme lerp(AppFeedbackBannerTheme? other, double t) {
    if (other == null) return this;
    return AppFeedbackBannerTheme(
      errorBackground: Color.lerp(errorBackground, other.errorBackground, t)!,
      errorBorder: Color.lerp(errorBorder, other.errorBorder, t)!,
      errorForeground: Color.lerp(errorForeground, other.errorForeground, t)!,
      successBackground: Color.lerp(successBackground, other.successBackground, t)!,
      successBorder: Color.lerp(successBorder, other.successBorder, t)!,
      successForeground: Color.lerp(successForeground, other.successForeground, t)!,
      warningBackground: Color.lerp(warningBackground, other.warningBackground, t)!,
      warningBorder: Color.lerp(warningBorder, other.warningBorder, t)!,
      warningForeground: Color.lerp(warningForeground, other.warningForeground, t)!,
      infoBackground: Color.lerp(infoBackground, other.infoBackground, t)!,
      infoBorder: Color.lerp(infoBorder, other.infoBorder, t)!,
      infoForeground: Color.lerp(infoForeground, other.infoForeground, t)!,
    );
  }
}