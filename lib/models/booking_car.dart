import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_car.freezed.dart';
part 'booking_car.g.dart';

@freezed
class BookingCar with _$BookingCar {
  const factory BookingCar({
    required String name,
    required String classCar,
    required String image,
    required int passengers,
    required String returningType,
    required int priceForDay,
    required bool isSelected,
  }) = _BookingCar;

  factory BookingCar.fromJson(Map<String, dynamic> json) =>
      _$BookingCarFromJson(json);
}
