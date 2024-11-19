import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_event.freezed.dart';
part 'calendar_event.g.dart';

@freezed
class CalendarEvent with _$CalendarEvent {
  const factory CalendarEvent({
    required DateTime startTime,
    required DateTime endTime,
    @ColorConverter() required Color? color,
    @ColorConverter() required Color? onColor,
    required String title,
    required String type,
    String? info,
    required List<String> participants,
  }) = _CalendarEvent;

  factory CalendarEvent.fromJson(Map<String, dynamic> json) =>
      _$CalendarEventFromJson(json);
}

class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color color) => color.value;
}
