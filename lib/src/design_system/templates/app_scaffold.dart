import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

/// Template base del sistema de diseño.
///
/// Envuelve el [Scaffold] de Flutter aplicando los defaults del sistema:
/// - Fondo desde [ColorScheme.surface]
/// - [AppBar] con el tema configurado en [AppAppBarTheme]
/// - [SafeArea] automático: aplica `top` solo cuando no hay [AppBar]
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.drawer,
    this.endDrawer,
    this.onDrawerChanged,
    this.onEndDrawerChanged,
    this.persistentFooterButtons,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.safeAreaConfig = const AppScaffoldSafeArea(),
  });

  /// AppBar de la pantalla. Ya hereda el [AppAppBarTheme] del tema global.
  ///
  /// Si es `null`, la pantalla no tendrá barra superior y el [SafeArea]
  /// aplicará `top` automáticamente.
  final PreferredSizeWidget? appBar;

  /// Contenido principal de la pantalla.
  final Widget body;

  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Widget? drawer;
  final Widget? endDrawer;
  final DrawerCallback? onDrawerChanged;
  final DrawerCallback? onEndDrawerChanged;
  final List<Widget>? persistentFooterButtons;
  final AlignmentDirectional persistentFooterAlignment;

  /// Sobreescribe el color de fondo. Por defecto usa [ColorScheme.surface].
  final Color? backgroundColor;

  final bool resizeToAvoidBottomInset;
  final bool extendBody;
  final bool extendBodyBehindAppBar;

  /// Configuración del [SafeArea] interno.
  ///
  /// El valor de [AppScaffoldSafeArea.top] se ignora cuando no hay [appBar]:
  /// en ese caso siempre se aplica safe area superior automáticamente.
  final AppScaffoldSafeArea safeAreaConfig;

  @override
  Widget build(BuildContext context) {
    // Si no hay AppBar, el sistema de diseño protege el área superior
    // automáticamente. El desarrollador no necesita recordarlo.
    final applyTopSafeArea = safeAreaConfig.top || appBar == null;

    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor ?? context.colorScheme.surface,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      drawer: drawer,
      endDrawer: endDrawer,
      onDrawerChanged: onDrawerChanged,
      onEndDrawerChanged: onEndDrawerChanged,
      persistentFooterButtons: persistentFooterButtons,
      persistentFooterAlignment: persistentFooterAlignment,
      body: SafeArea(
        top: applyTopSafeArea,
        bottom: safeAreaConfig.bottom,
        left: safeAreaConfig.left,
        right: safeAreaConfig.right,
        minimum: safeAreaConfig.minimum,
        maintainBottomViewPadding: safeAreaConfig.maintainBottomViewPadding,
        child: body,
      ),
    );
  }
}

/// Configuración del [SafeArea] interno del [AppScaffold].
///
/// El lado `top` es gestionado automáticamente por [AppScaffold]:
/// - Con [AppScaffold.appBar]: `top` es `false` (el AppBar ya cubre ese inset).
/// - Sin [AppScaffold.appBar]: `top` es `true` independientemente del valor aquí.
///
/// Solo necesitas cambiar [top] si usas [AppScaffold.extendBodyBehindAppBar].
final class AppScaffoldSafeArea {
  /// {@macro app_scaffold_safe_area}
  const AppScaffoldSafeArea({
    this.top = false,
    this.bottom = true,
    this.left = true,
    this.right = true,
    this.minimum = EdgeInsets.zero,
    this.maintainBottomViewPadding = false,
  });

  /// Normalmente no necesitas cambiar este valor: [AppScaffold] lo gestiona
  /// automáticamente según la presencia de [AppScaffold.appBar].
  ///
  /// El único caso donde sí importa pasarlo explícitamente es cuando usas
  /// [AppScaffold.extendBodyBehindAppBar] en `true` y necesitas que el body
  /// comience desde el borde físico de la pantalla.
  final bool top;
  final bool bottom;
  final bool left;
  final bool right;
  final EdgeInsets minimum;
  final bool maintainBottomViewPadding;
}