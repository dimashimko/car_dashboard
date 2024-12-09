// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      text: json['text'] as String,
      audio: json['audio'] as String?,
      isMy: json['isMy'] as bool,
      dateTime: DateTime.parse(json['dateTime'] as String),
      isRead: json['isRead'] as bool,
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'audio': instance.audio,
      'isMy': instance.isMy,
      'dateTime': instance.dateTime.toIso8601String(),
      'isRead': instance.isRead,
    };
