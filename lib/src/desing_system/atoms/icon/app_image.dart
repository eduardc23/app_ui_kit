import 'dart:io';

import 'package:flutter/material.dart';

enum AppImageSource { network, asset, file }

/// Átomo de imagen del design system.
///
/// Tres variantes según el origen de la imagen: [AppImage.network],
/// [AppImage.asset] y [AppImage.file]. Los estados de carga y error
/// son coherentes con el tema activo.
class AppImage extends StatelessWidget {
  const AppImage._({
    required this.source,
    required this.url,
    required this.assetPath,
    required this.file,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholderColor,
    this.errorIcon = Icons.broken_image_outlined,
    super.key,
  });

  /// Imagen cargada desde una URL de internet.
  const factory AppImage.network(
    String url, {
    Key? key,
    double? width,
    double? height,
    BoxFit fit,
    Color? placeholderColor,
    IconData errorIcon,
  }) = _AppImageNetwork;

  /// Imagen cargada desde los assets del proyecto.
  const factory AppImage.asset(
    String path, {
    Key? key,
    double? width,
    double? height,
    BoxFit fit,
    Color? placeholderColor,
    IconData errorIcon,
  }) = _AppImageAsset;

  /// Imagen cargada desde un archivo local del sistema de archivos.
  const factory AppImage.file(
    File file, {
    Key? key,
    double? width,
    double? height,
    BoxFit fit,
    Color? placeholderColor,
    IconData errorIcon,
  }) = _AppImageFile;

  // ── Propiedades ───────────────────────────────────────────────────────────

  /// Variante de fuente de la imagen.
  final AppImageSource source;

  /// URL de red. Solo presente en [AppImage.network].
  final String? url;

  /// Ruta de asset. Solo presente en [AppImage.asset].
  final String? assetPath;

  /// Archivo local. Solo presente en [AppImage.file].
  final File? file;

  /// Ancho del widget. Si es nulo, ocupa el ancho disponible.
  final double? width;

  /// Alto del widget. Si es nulo, se ajusta al contenido.
  final double? height;

  /// Cómo ajustar la imagen dentro de sus límites. Por defecto [BoxFit.cover].
  final BoxFit fit;

  /// Color del placeholder mientras carga o en estado de error.
  /// Si es nulo usa [ColorScheme.surfaceContainerHighest].
  final Color? placeholderColor;

  /// Icono a mostrar cuando la imagen no puede cargarse.
  final IconData errorIcon;

  // ── Helpers privados de estado ────────────────────────────────────────────

  Widget _placeholder(BuildContext context) {
    final color =
        placeholderColor ??
        Theme.of(context).colorScheme.surfaceContainerHighest;
    return ColoredBox(
      color: color,
      child: SizedBox(
        width: width ?? double.infinity,
        height: height,
        child: const Center(child: CircularProgressIndicator.adaptive()),
      ),
    );
  }

  Widget _error(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ColoredBox(
      color: placeholderColor ?? colorScheme.surfaceContainerHighest,
      child: SizedBox(
        width: width ?? double.infinity,
        height: height,
        child: Center(
          child: Icon(errorIcon, size: 40, color: colorScheme.onSurfaceVariant),
        ),
      ),
    );
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return switch (source) {
      AppImageSource.network => Image.network(
        url!,
        width: width ?? double.infinity,
        height: height,
        fit: fit,
        loadingBuilder: (context, child, loadingProgress) =>
            loadingProgress == null ? child : _placeholder(context),
        errorBuilder: (context, _, __) => _error(context),
      ),
      AppImageSource.asset => Image.asset(
        assetPath!,
        width: width ?? double.infinity,
        height: height,
        fit: fit,
        errorBuilder: (context, _, __) => _error(context),
      ),
      AppImageSource.file => Image.file(
        file!,
        width: width ?? double.infinity,
        height: height,
        fit: fit,
        errorBuilder: (context, _, __) => _error(context),
      ),
    };
  }
}

class _AppImageNetwork extends AppImage {
  const _AppImageNetwork(
    String url, {
    super.key,
    super.width,
    super.height,
    super.fit,
    super.placeholderColor,
    super.errorIcon,
  }) : super._(
         source: AppImageSource.network,
         url: url,
         assetPath: null,
         file: null,
       );
}

class _AppImageAsset extends AppImage {
  const _AppImageAsset(
    String path, {
    super.key,
    super.width,
    super.height,
    super.fit,
    super.placeholderColor,
    super.errorIcon,
  }) : super._(
         source: AppImageSource.asset,
         url: null,
         assetPath: path,
         file: null,
       );
}

class _AppImageFile extends AppImage {
  const _AppImageFile(
    File file, {
    super.key,
    super.width,
    super.height,
    super.fit,
    super.placeholderColor,
    super.errorIcon,
  }) : super._(
         source: AppImageSource.file,
         url: null,
         assetPath: null,
         file: file,
       );
}
