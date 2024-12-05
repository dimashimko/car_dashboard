import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_required.freezed.dart';
part 'service_required.g.dart';

@freezed
class ServiceRequired with _$ServiceRequired {
  const factory ServiceRequired({
    required String name,
    required String iconPath,
    required double price,
    @ColorConverter() required Color color,
    required int processing,
  }) = _ServiceRequired;

  factory ServiceRequired.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequiredFromJson(json);
}

class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color color) => color.value;
}
