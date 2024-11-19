import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ModuloExtension on int {
  /// Returns the modulo of the integer.
  /// Ensures the result is always non-negative, even for negative integers.
  int get modulo {
    if (this > 0) return this;
    return this * -1;
  }
}

extension SizeExtension on num {
  double toResponsive(BoxConstraints constraints) {
    return this * constraints.maxWidth * 0.0024;
  }
}

extension DateTimeFormatter on DateTime {
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
