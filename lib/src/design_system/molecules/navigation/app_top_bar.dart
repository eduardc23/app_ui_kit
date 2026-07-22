import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

/// Barra superior personalizada para el sistema de diseño.
///
/// Muestra un título centrado y acciones opcionales.
/// También puede mostrar un icono de menú para abrir el drawer.
class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({
    super.key,
    required this.title,
    this.actions,
    this.showDrawerIcon = true,
    this.onMenuPressed,
  });

  /// El texto que se muestra como título centrado.
  final String title;

  /// Widgets de acción opcionales que se muestran al final de la barra.
  final List<Widget>? actions;

  /// Determina si se debe mostrar el icono del drawer en la parte inicial.
  ///
  /// Por defecto es `true`.
  final bool showDrawerIcon;

  final VoidCallback? onMenuPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showDrawerIcon
          ? IconButton(
              icon: const Icon(Icons.menu),
              onPressed:
                  onMenuPressed ?? () => Scaffold.of(context).openDrawer(),
            )
          : null,
      centerTitle: true,
      title: AppText(
        title,
        variant: AppTextVariant.titleMedium,
      ),
      actions: actions,
    );
  }
}
