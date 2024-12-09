import 'package:car_dashboard/resources/app_typography.dart';
import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:car_dashboard/widgets/dividers/custom_small_divider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../models/part_car_status.dart';
import 'condition_indicator.dart';

class ServiceStatusBarCard extends StatelessWidget {
  const ServiceStatusBarCard({
    super.key,
    required this.partCarStatus,
  });

  final PartCarStatus partCarStatus;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              partCarStatus.imagePath,
            ),
            const Gap(20.0),
            Text(
              partCarStatus.name,
              style: AppTypography.headingH3.copyWith(
                color: colors(context).blackWhite,
              ),
            ),
            const Gap(10.0),
            Row(
              children: [
                Text(
                  partCarStatus.carPart,
                  style: AppTypography.title16m.copyWith(
                    color: colors(context).statisticsTextLabel,
                  ),
                ),
                const Gap(14.0),
                const CustomSmallDivider(),
                const Gap(14.0),
                Text(
                  partCarStatus.status,
                  style: AppTypography.title16m.copyWith(
                    color: colors(context).statisticsTextLabel,
                  ),
                ),
              ],
            ),
            ConditionIndicator(
              conditionValue: partCarStatus.condition,
              indicatorColor: partCarStatus.color,
            ),
          ],
        ),
      ],
    );
  }
}
