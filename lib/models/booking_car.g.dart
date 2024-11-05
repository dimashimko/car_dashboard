// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingCarImpl _$$BookingCarImplFromJson(Map<String, dynamic> json) =>
    _$BookingCarImpl(
      name: json['name'] as String,
      classCar: json['classCar'] as String,
      image: json['image'] as String,
      passengers: (json['passengers'] as num).toInt(),
      returningType: json['returningType'] as String,
      priceForDay: (json['priceForDay'] as num).toInt(),
      isSelected: json['isSelected'] as bool,
    );

Map<String, dynamic> _$$BookingCarImplToJson(_$BookingCarImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'classCar': instance.classCar,
      'image': instance.image,
      'passengers': instance.passengers,
      'returningType': instance.returningType,
      'priceForDay': instance.priceForDay,
      'isSelected': instance.isSelected,
    };
