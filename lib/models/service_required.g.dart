// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_required.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceRequiredImpl _$$ServiceRequiredImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceRequiredImpl(
      name: json['name'] as String,
      iconPath: json['iconPath'] as String,
      price: (json['price'] as num).toDouble(),
      color: const ColorConverter().fromJson((json['color'] as num).toInt()),
      processing: (json['processing'] as num).toInt(),
    );

Map<String, dynamic> _$$ServiceRequiredImplToJson(
        _$ServiceRequiredImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'iconPath': instance.iconPath,
      'price': instance.price,
      'color': const ColorConverter().toJson(instance.color),
      'processing': instance.processing,
    };
