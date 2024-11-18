import 'package:flutter/material.dart';

extension SizeExtension on num {
  double toResponsive(BoxConstraints constraints) {
    return this * constraints.maxWidth * 0.0024;
  }
}

extension DateTimeFormatter on DateTime {
  double toPadding(scaleFactor) {
    return (hour * scaleFactor) + (minute * scaleFactor) / 60;
  }

  String get toHourMinuteAmPm {
    int hourStr = hour == 0
        ? 12
        : hour > 12
            ? hour - 12
            : hour;
    return "${hourStr.toString().padLeft(2, '0')}:"
        "${minute.toString().padLeft(2, '0')} ";
    // "${hour < 12 ? 'AM' : 'PM'}";
  }
}

extension DurationExtension on Duration {
  double toHeight(scaleFactor) {
    return (inMinutes * scaleFactor) / 60;
  }
}
