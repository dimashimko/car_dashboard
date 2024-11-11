// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfferImpl _$$OfferImplFromJson(Map<String, dynamic> json) => _$OfferImpl(
      name: json['name'] as String,
      averagePrice: (json['averagePrice'] as num).toDouble(),
      marketAverage: (json['marketAverage'] as num).toDouble(),
      impressionShare: (json['impressionShare'] as num).toDouble(),
      p1: (json['p1'] as num).toDouble(),
      p2: (json['p2'] as num).toDouble(),
      p3: (json['p3'] as num).toDouble(),
      pSum: (json['pSum'] as num).toDouble(),
      modelSpendCar: (json['modelSpendCar'] as num).toDouble(),
      modelSpendReturn: (json['modelSpendReturn'] as num).toDouble(),
      spendPerUnitTurned: (json['spendPerUnitTurned'] as num).toDouble(),
    );

Map<String, dynamic> _$$OfferImplToJson(_$OfferImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'averagePrice': instance.averagePrice,
      'marketAverage': instance.marketAverage,
      'impressionShare': instance.impressionShare,
      'p1': instance.p1,
      'p2': instance.p2,
      'p3': instance.p3,
      'pSum': instance.pSum,
      'modelSpendCar': instance.modelSpendCar,
      'modelSpendReturn': instance.modelSpendReturn,
      'spendPerUnitTurned': instance.spendPerUnitTurned,
    };
