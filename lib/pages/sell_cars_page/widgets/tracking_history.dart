import 'package:car_dashboard/resources/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../resources/theme/custom_theme_extension.dart';
import 'track_history_chart.dart';

class TrackingHistory extends StatelessWidget {
  const TrackingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors(context).background,
        borderRadius: const BorderRadius.all(
          Radius.circular(14.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 28.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Tracking History',
              style: AppTypography.headingH2.copyWith(
                color: colors(context).parametersTextColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Gap(25.0),
            TrackHistoryChart(),
          ],
        ),
      ),
    );
  }
}
