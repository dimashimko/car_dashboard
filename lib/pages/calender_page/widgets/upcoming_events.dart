import 'package:car_dashboard/resources/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../resources/theme/custom_theme_extension.dart';
import 'custom_small_planer.dart';

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({super.key});

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
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upcoming Events',
              style: AppTypography.headingH2.copyWith(
                color: colors(context).parametersTextColor,
              ),
            ),
            const Gap(24.0),
            const CustomSmallPlaner(),
          ],
        ),
      ),
    );
  }
}
