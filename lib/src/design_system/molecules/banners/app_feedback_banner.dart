import 'package:flutter/material.dart';

import '../../../design_system/tokens/tokens.dart';
import 'app_banner_content.dart';

enum AppFeedbackType { success, warning, error, info }

/// Banner de retroalimentación contextual del sistema de diseño.
///
/// Molécula que compone [AppIcon] y [AppText] para comunicar estados
/// al usuario. Soporta animación de entrada/salida mediante [AnimatedSwitcher].
///
/// Cuando [message] es `null`, el banner se oculta con animación.
class AppFeedbackBanner extends StatelessWidget {
  const AppFeedbackBanner._({
    this.message,
    required this.type,
    super.key,
  });

  /// Error de validación o fallo de operación.
  const factory AppFeedbackBanner.error({
    Key? key,
    required String? message,
  }) = _AppFeedbackBannerError;

  /// Operación completada exitosamente.
  const factory AppFeedbackBanner.success({
    Key? key,
    required String? message,
  }) = _AppFeedbackBannerSuccess;

  /// Advertencia no bloqueante.
  const factory AppFeedbackBanner.warning({
    Key? key,
    required String? message,
  }) = _AppFeedbackBannerWarning;

  /// Información contextual neutral.
  const factory AppFeedbackBanner.info({
    Key? key,
    required String? message,
  }) = _AppFeedbackBannerInfo;

  final String? message;
  final AppFeedbackType type;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: AppDurations.medium,
      transitionBuilder: (child, animation) => SizeTransition(
        sizeFactor: animation,
        alignment: Alignment.topCenter,
        child: FadeTransition(opacity: animation, child: child),
      ),
      child: message != null
          ? AppBannerContent(
              key: ValueKey('feedback-banner-${type.name}'),
              type: type,
              message: message!,
            )
          : const SizedBox.shrink(key: ValueKey('feedback-banner-empty')),
    );
  }
}

// Subclases privadas — solo vinculan el tipo al constructor nombrado
class _AppFeedbackBannerError extends AppFeedbackBanner {
  const _AppFeedbackBannerError({super.key, required super.message})
      : super._(type: AppFeedbackType.error);
}

class _AppFeedbackBannerSuccess extends AppFeedbackBanner {
  const _AppFeedbackBannerSuccess({super.key, required super.message})
      : super._(type: AppFeedbackType.success);
}

class _AppFeedbackBannerWarning extends AppFeedbackBanner {
  const _AppFeedbackBannerWarning({super.key, required super.message})
      : super._(type: AppFeedbackType.warning);
}

class _AppFeedbackBannerInfo extends AppFeedbackBanner {
  const _AppFeedbackBannerInfo({super.key, required super.message})
      : super._(type: AppFeedbackType.info);
}
