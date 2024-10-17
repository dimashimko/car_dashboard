import 'dart:ui';

class Car {
  Car({
    required this.name,
    required this.recommended,
    required this.image,
    required this.range,
    required this.isRepeat,
    required this.isFavorite,
    required this.isEnergy,
    required this.priceForHour,
    required this.backgroundColor,
  });

  final String name;
  final int recommended;
  final String image;
  final int range;
  final bool isFavorite;
  final bool isRepeat;
  final bool isEnergy;
  final int priceForHour;
  final Color backgroundColor;
}
