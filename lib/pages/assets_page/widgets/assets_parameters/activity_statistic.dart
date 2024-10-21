import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../resources/app_typography.dart';
import '../../../../resources/theme/custom_theme_extension.dart';
import 'activity_chart.dart';

class ActivityStatistic extends StatelessWidget {
  const ActivityStatistic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors(context).background,
        borderRadius: const BorderRadius.all(
          Radius.circular(14.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 27.0,
          bottom: 17.0,
          right: 24.0,
          left: 24.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Activity ',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: colors(context).parametersTextColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Text(
                  'View All',
                  style: AppTypography.title14m.copyWith(
                    color: colors(context).assetsGrayText,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const Gap(20.0),
            const ActivityChart(),
          ],
        ),
      ),
    );
  }
}
