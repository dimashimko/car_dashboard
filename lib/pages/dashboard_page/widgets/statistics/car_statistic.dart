import 'package:car_dashboard/resources/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_button/flutter_toggle_button.dart';
import 'package:gap/gap.dart';

import '../../../../resources/app_typography.dart';
import '../../../../resources/theme/custom_theme_extension.dart';
import 'car_chart.dart';

class CarStatistic extends StatelessWidget {
  const CarStatistic({super.key});

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
                  'Car ',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: colors(context).parametersTextColor,
                  ),
                ),
                Text(
                  'Statistics',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: colors(context).parametersTextColor,
                  ),
                ),
              ],
            ),
            const Gap(20.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '20 February 2022',
                    style: AppTypography.title14b.copyWith(
                      color: colors(context).statisticsTextSecondary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                FlutterToggleButton(
                  buttonTextFontSize: 10,
                  enableTextFontWeight: FontWeight.w700,
                  disableTextFontWeight: FontWeight.w700,
                  buttonHeight: 20,
                  buttonWidth: 54,
                  outerContainerMargin: 0.0,
                  buttonColor: AppColors.secondary.orange,
                  outerContainerColor:
                      colors(context).dateRangeSelectorBackground,
                  disableTextColor: colors(context).textSecondary,
                  items: const ['Day', 'Week', 'Month'],
                  onTap: (index) {
                    if (kDebugMode) {
                      print('Selected index = $index');
                    }
                  },
                ),
              ],
            ),
            const CarChart(),
          ],
        ),
      ),
    );
  }
}
