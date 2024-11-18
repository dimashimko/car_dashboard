// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalendarEventImpl _$$CalendarEventImplFromJson(Map<String, dynamic> json) =>
    _$CalendarEventImpl(
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      color: _$JsonConverterFromJson<int, Color>(
          json['color'], const ColorConverter().fromJson),
      onColor: _$JsonConverterFromJson<int, Color>(
          json['onColor'], const ColorConverter().fromJson),
      title: json['title'] as String,
      type: json['type'] as String,
      participants: (json['participants'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$CalendarEventImplToJson(_$CalendarEventImpl instance) =>
    <String, dynamic>{
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'color': _$JsonConverterToJson<int, Color>(
          instance.color, const ColorConverter().toJson),
      'onColor': _$JsonConverterToJson<int, Color>(
          instance.onColor, const ColorConverter().toJson),
      'title': instance.title,
      'type': instance.type,
      'participants': instance.participants,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
