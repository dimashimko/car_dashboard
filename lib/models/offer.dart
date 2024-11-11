import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer.freezed.dart';
part 'offer.g.dart';

@freezed
class Offer with _$Offer {
  const factory Offer({
    required String name,
    required double averagePrice,
    required double marketAverage,
    required double impressionShare,
    required double p1,
    required double p2,
    required double p3,
    required double pSum,
    required double modelSpendCar,
    required double modelSpendReturn,
    required double spendPerUnitTurned,
  }) = _Offer;

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
}
