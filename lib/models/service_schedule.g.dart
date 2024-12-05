// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceScheduleImpl _$$ServiceScheduleImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceScheduleImpl(
      text: json['text'] as String,
      when: json['when'] as String,
      fixPrice: (json['fixPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$$ServiceScheduleImplToJson(
        _$ServiceScheduleImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'when': instance.when,
      'fixPrice': instance.fixPrice,
    };
