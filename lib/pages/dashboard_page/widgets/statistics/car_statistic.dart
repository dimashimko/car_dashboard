import 'package:car_dashboard/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_button/flutter_toggle_button.dart';

import '../../../../resources/theme/custom_theme_extension.dart';

class CarStatistic extends StatelessWidget {
  const CarStatistic({super.key});

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
            Row(
              children: [
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
                    print('Selected index = $index');
                  },
                ),
                // ToggleSwitch(
                //   initialLabelIndex: 0,
                //   totalSwitches: 3,
                //   labels: const ['Day', 'Week', 'Month'],
                //   animate: true,
                //   curve: Curves.decelerate,
                //   onToggle: (index) {
                //     if (kDebugMode) {
                //       print('switched to: $index');
                //     }
                //   },
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
