import 'package:intl/date_symbol_data_local.dart';

/// Inicializa los datos de localización requeridos por el design system.
/// Debe llamarse en [main] antes de [runApp].
///
/// ```dart
/// void main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///   await AppIntl.initialize();
///   runApp(const MyApp());
/// }
/// ```
abstract final class AppIntl {
  static Future<void> initialize() async {
    await initializeDateFormatting();
  }
}
