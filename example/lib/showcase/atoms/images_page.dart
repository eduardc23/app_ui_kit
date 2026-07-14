import 'dart:io';

import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ImagesPage extends StatefulWidget {
  const ImagesPage({super.key});

  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  File? _localFile;
  bool _isLoadingFile = true;

  @override
  void initState() {
    super.initState();
    _prepareLocalFile();
  }

  /// Simula la obtención de un archivo local copiando un asset al sistema de archivos.
  Future<void> _prepareLocalFile() async {
    try {
      final byteData = await rootBundle.load('assets/flutter_image.png');
      final tempDir = await getTemporaryDirectory();
      final file = File(p.join(tempDir.path, 'temp_showcase_image.png'));

      await file.writeAsBytes(
        byteData.buffer
            .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
      );

      if (mounted) {
        setState(() {
          _localFile = file;
          _isLoadingFile = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoadingFile = false;
        });
      }
    }
  }

  Widget _buildFileImageShowcase() {
    if (_isLoadingFile) {
      return SizedBox(
        height: 200,
        child: Center(child: AppLoader.medium()),
      );
    }

    if (_localFile == null) {
      return SizedBox(
        height: 200,
        child: Center(
          child: AppText(
            'Error loading local file',
            variant: AppTextVariant.titleMedium,
          ),
        ),
      );
    }

    return AppImage.file(
      _localFile!,
      height: 200,
      fit: BoxFit.contain,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppText('Images', variant: AppTextVariant.titleLarge)),
      body: ListView(
        padding: AppSpacing.md.all,
        children: [
          const _ShowcaseSection(
            title: 'Asset Image',
            child: AppImage.asset(
              'assets/flutter_image.png',
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
          const _ShowcaseSection(
            title: 'Network Image',
            child: AppImage.network(
             'https://images.unsplash.com/photo-1579546929518-9e396f3cc809?w=400',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          _ShowcaseSection(
            title: 'File Image (Local File)',
            child: _buildFileImageShowcase(),
          ),
          const _ShowcaseSection(
            title: 'Image with Error',
            child: AppImage.network(
              'https://invalid-url.com/image.jpg',
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}

class _ShowcaseSection extends StatelessWidget {
  final String title;
  final Widget child;

  const _ShowcaseSection({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title,
          variant: AppTextVariant.titleMedium,
        ),
        AppSpacing.sm.vGap,
        child,
        AppSpacing.xxl.vGap,
      ],
    );
  }
}
