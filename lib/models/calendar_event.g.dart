// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalendarEventImpl _$$CalendarEventImplFromJson(Map<String, dynamic> json) =>
    _$CalendarEventImpl(
      id: (json['id'] as num).toInt(),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      color: _$JsonConverterFromJson<int, Color>(
          json['color'], const ColorConverter().fromJson),
      onColor: _$JsonConverterFromJson<int, Color>(
          json['onColor'], const ColorConverter().fromJson),
      title: json['title'] as String,
      type: json['type'] as String,
      info: json['info'] as String?,
      participants: (json['participants'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      columnNumber: (json['columnNumber'] as num?)?.toInt() ?? 1,
      widthLevel: (json['widthLevel'] as num?)?.toInt() ?? 1,
      relatedId: (json['relatedId'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CalendarEventImplToJson(_$CalendarEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'color': _$JsonConverterToJson<int, Color>(
          instance.color, const ColorConverter().toJson),
      'onColor': _$JsonConverterToJson<int, Color>(
          instance.onColor, const ColorConverter().toJson),
      'title': instance.title,
      'type': instance.type,
      'info': instance.info,
      'participants': instance.participants,
      'columnNumber': instance.columnNumber,
      'widthLevel': instance.widthLevel,
      'relatedId': instance.relatedId,
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
