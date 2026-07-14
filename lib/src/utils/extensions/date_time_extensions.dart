import 'package:intl/intl.dart';

extension AppDateTimeX on DateTime {
  /// "Sáb 20 Sep · 20:00 h"
  String toEventDate({String locale = 'es'}) {
    final datePart = DateFormat('EEE d MMM', locale).format(this); // "sáb. 20 sept."
    final timePart = DateFormat('HH:mm', locale).format(this);     // "20:00"
    return '$datePart · $timePart h';
  }
}