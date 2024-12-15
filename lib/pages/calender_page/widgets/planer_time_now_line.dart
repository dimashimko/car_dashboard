import 'package:car_dashboard/resources/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../generated/assets.gen.dart';
import '../../../resources/app_colors.dart';

class PlanerTimeNowLine extends StatelessWidget {
  const PlanerTimeNowLine({
    super.key,
    required this.time,
    required this.timeWidth,
  });

  final String time;
  final double timeWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: timeWidth,
              child: Text(
                time,
                style: AppTypography.title14m.copyWith(
                  color: AppColors.upcomingEventsTimeNowText,
                ),
              ),
            ),
            const Gap(8.0),
            Expanded(
              child: Row(
                children: [
                  Assets.icons.point.svg(),
                  Expanded(
                    child: Container(
                      color: Colors.grey,
                      width: double.infinity,
                      height: 1.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
