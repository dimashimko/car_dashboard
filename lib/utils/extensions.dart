import 'package:intl/intl.dart';

import '../models/calendar_event.dart';

extension DoubleExtensions on double {
  String toCurrencyString() {
    final formatter = NumberFormat('#,###.##');
    return '${formatter.format(this)}';
  }

  String toFormattedString() {
    return (this % 1 == 0) ? toStringAsFixed(0) : toStringAsFixed(2);
  }
}

extension ListCalendarEventX on List<CalendarEvent> {
  List<CalendarEvent> get sorted {
    final sortedList = [...this];
    sortedList.sort((a, b) => a.startTime.compareTo(b.startTime));
    return sortedList;
  }
}

extension ModuloExtension on int {
  int get modulo {
    if (this > 0) return this;
    return this * -1;
  }
}

extension SizeExtension on num {
  double toResponsive(double maxWidth) {
    return this * maxWidth * 0.0024;
  }
}

extension DateTimeFormatter on DateTime {
  String toFriendlyString() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(Duration(days: 1));
    final date = DateTime(year, month, day);

    if (date == today) {
      return DateFormat.jm().format(this); // e.g., "4:30 PM"
    } else if (date == yesterday) {
      return "Yesterday";
    } else {
      return DateFormat('MMM d, yyyy').format(this); // e.g., "Dec 8, 2024"
    }
  }

  String get toFormattedString {
    return DateFormat('MMM d, y').format(this);
  }

  double toPadding(scaleFactor) {
    return (hour * scaleFactor) + (minute * scaleFactor) / 60;
  }

  String get toHourMinute {
    int hourStr = hour == 0
        ? 12
        : hour > 12
            ? hour - 12
            : hour;
    return "${hourStr.toString().padLeft(2, '0')}:"
        "${minute.toString().padLeft(2, '0')} ";
    // "${hour < 12 ? 'AM' : 'PM'}";
  }

  String get toHourMinuteAmPm {
    int hourStr = hour == 0
        ? 12
        : hour > 12
            ? hour - 12
            : hour;
    return "${hourStr.toString().padLeft(2, '0')}:"
        "${minute.toString().padLeft(2, '0')} "
        "${hour < 12 ? 'AM' : 'PM'}";
  }
}

extension DurationExtension on Duration {
  double toHeight(scaleFactor) {
    return (inMinutes * scaleFactor) / 60;
  }
}
