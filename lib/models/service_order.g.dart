// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceOrderImpl _$$ServiceOrderImplFromJson(Map<String, dynamic> json) =>
    _$ServiceOrderImpl(
      name: json['name'] as String,
      color: const ColorConverter().fromJson((json['color'] as num).toInt()),
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$ServiceOrderImplToJson(_$ServiceOrderImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'color': const ColorConverter().toJson(instance.color),
      'price': instance.price,
    };
