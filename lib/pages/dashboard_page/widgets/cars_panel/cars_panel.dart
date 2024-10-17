import 'package:car_dashboard/generated/assets.gen.dart';
import 'package:car_dashboard/resources/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../models/car_model/car_model.dart';
import 'car_card.dart';

class CarsPanel extends StatelessWidget {
  CarsPanel({super.key});

  final List<Car> data = [
    Car(
      name: 'Mini Cooper',
      recommended: 64,
      image: Assets.images.miniCooper.path,
      isRepeat: true,
      range: 132,
      isFavorite: true,
      isEnergy: true,
      priceForHour: 32,
      backgroundColor: AppColors.tertiary.secondary1,
    ),
    Car(
      name: 'Porsche 911 Carrera',
      recommended: 74,
      image: Assets.images.porscheCarella1.path,
      isRepeat: true,
      range: 130,
      isFavorite: true,
      isEnergy: true,
      priceForHour: 28,
      backgroundColor: AppColors.tertiary.secondary2,
    ),
    Car(
      name: 'Porsche 911 Carrera',
      recommended: 74,
      isRepeat: true,
      image: Assets.images.porscheCarella2.path,
      range: 130,
      isFavorite: true,
      isEnergy: true,
      priceForHour: 28,
      backgroundColor: AppColors.palePinkishPeach,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: data.length * 4,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 485.0, // or another value
        mainAxisExtent: 236.0,
        crossAxisSpacing: 29.0,
        mainAxisSpacing: 29.0,
      ),
      itemBuilder: (context, index) {
        return CarCard(
          carModel: data[index % data.length],
        );
      },
    );
  }
}
