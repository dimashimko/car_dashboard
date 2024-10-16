import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_button/flutter_toggle_button.dart';

import '../../../../resources/app_fonts.dart';
import '../../../../resources/theme/custom_theme_extension.dart';
import 'milses_chart.dart';

class MilesStatistic extends StatelessWidget {
  const MilesStatistic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 400,
        maxWidth: 500,
      ),
      height: 332.0,
      decoration: BoxDecoration(
        color: colors(context).background,
        borderRadius: const BorderRadius.all(
          Radius.circular(14.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 35.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Miles ',
                  style: AppTypography.headingH3.copyWith(
                    color: colors(context).parametersTextColor,
                  ),
                ),
                Text(
                  'Statistics',
                  style: AppTypography.headingH3.copyWith(
                    color: colors(context).parametersTextColor,
                    fontWeight: AppFonts.regular,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlutterToggleButton(
                  buttonTextFontSize: 10.0,
                  enableTextFontWeight: FontWeight.w700,
                  disableTextFontWeight: FontWeight.w700,
                  buttonHeight: 20.0,
                  buttonWidth: 54.0,
                  outerContainerMargin: 0.0,
                  buttonColor: AppColors.secondary.blue,
                  outerContainerColor: colors(context).background,
                  disableTextColor: colors(context).textSecondary,
                  items: const ['Day', 'Week', 'Month'],
                  onTap: (index) {},
                ),
                Text(
                  '256 miles',
                  style: AppTypography.title14b.copyWith(
                    color: colors(context).statisticsTextSecondary,
                  ),
                ),
              ],
            ),
            const MilesChart(),
          ],
        ),
      ),
    );
  }
}
