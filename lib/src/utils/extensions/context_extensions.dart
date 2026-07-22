import 'package:flutter/material.dart';

extension AppContextX on BuildContext {
  /// Devuelve el [ThemeData] del [BuildContext] actual.
  ThemeData get theme => Theme.of(this);

  /// Devuelve el [ColorScheme] del [BuildContext] actual.
  ColorScheme get colorScheme => theme.colorScheme;

  /// Devuelve el [TextTheme] del [BuildContext] actual.
  TextTheme get textTheme => theme.textTheme;

  /// Devuelve el [Brightness] del tema actual.
  Brightness get brightness => theme.brightness;

  /// Devuelve [true] si el [Brightness] actual es [Brightness.dark].
  bool get isDarkMode => brightness == Brightness.dark;
}
