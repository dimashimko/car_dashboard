import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'part_car_status.freezed.dart';
part 'part_car_status.g.dart';

@freezed
class PartCarStatus with _$PartCarStatus {
  const factory PartCarStatus({
    required String imagePath,
    required String name,
    required String carPart,
    required String status,
    required double condition,
    @ColorConverter() required Color color,
  }) = _PartCarStatus;

  factory PartCarStatus.fromJson(Map<String, dynamic> json) =>
      _$PartCarStatusFromJson(json);
}

class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color color) => color.value;
}
