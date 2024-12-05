import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_order.freezed.dart';
part 'service_order.g.dart';

@freezed
class ServiceOrder with _$ServiceOrder {
  const factory ServiceOrder({
    required String name,
    @ColorConverter() required Color color,
    required double price,
  }) = _ServiceOrder;

  factory ServiceOrder.fromJson(Map<String, dynamic> json) =>
      _$ServiceOrderFromJson(json);
}

class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color color) => color.value;
}
