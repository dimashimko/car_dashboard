import 'package:car_dashboard/models/car.dart';
import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../generated/assets.gen.dart';

class CarCard extends StatelessWidget {
  const CarCard({
    super.key,
    required this.carModel,
  });

  final Car carModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: const BoxConstraints(
      //   minWidth: 400,
      // ),
      width: 400,
      decoration: BoxDecoration(
        color: carModel.backgroundColor,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 27.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Assets.icons.recomended.svg(),
                const Gap(10.0),
                Expanded(
                  child: Text(
                    '${carModel.recommended}% Recommend',
                    style: AppTypography.title14b.copyWith(
                      color: AppColors.primary.dark1,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const Gap(11.0),
            Expanded(
              child: Center(
                child: Image.asset(
                  carModel.image,
                ),
              ),
            ),
            Text(
              carModel.name,
              style: AppTypography.headingH3.copyWith(
                color: AppColors.gray.dark,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const Gap(8.0),
            Row(
              children: [
                if (carModel.isRepeat) ...[
                  Assets.icons.repeat.svg(),
                ],
                const Gap(16.0),
                Text(
                  '${carModel.range}K',
                  style: AppTypography.title14m.copyWith(
                    color: AppColors.gray.dark3,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                if (carModel.isRepeat) ...[
                  const Gap(16.0),
                  Assets.icons.star.svg(),
                ],
                if (carModel.isEnergy) ...[
                  const Gap(16.0),
                  Assets.icons.energySmall.svg(),
                ],
                const Spacer(),
                const Gap(16.0),
                Text(
                  '\$${carModel.priceForHour}/h',
                  style: AppTypography.title14m.copyWith(
                    color: AppColors.gray.dark3,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
