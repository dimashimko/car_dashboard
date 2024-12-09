// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_car_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PartCarStatusImpl _$$PartCarStatusImplFromJson(Map<String, dynamic> json) =>
    _$PartCarStatusImpl(
      imagePath: json['imagePath'] as String,
      name: json['name'] as String,
      carPart: json['carPart'] as String,
      status: json['status'] as String,
      condition: (json['condition'] as num).toDouble(),
      color: const ColorConverter().fromJson((json['color'] as num).toInt()),
    );

Map<String, dynamic> _$$PartCarStatusImplToJson(_$PartCarStatusImpl instance) =>
    <String, dynamic>{
      'imagePath': instance.imagePath,
      'name': instance.name,
      'carPart': instance.carPart,
      'status': instance.status,
      'condition': instance.condition,
      'color': const ColorConverter().toJson(instance.color),
    };
