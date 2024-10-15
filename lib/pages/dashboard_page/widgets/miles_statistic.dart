import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../resources/theme/custom_theme_extension.dart';

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
            const Row(
              children: [
                Text(
                  'Miles',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Statistics',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                ToggleSwitch(
                  initialLabelIndex: 0,
                  totalSwitches: 3,
                  labels: const ['Day', 'Week', 'Month'],
                  animate: true,
                  curve: Curves.decelerate,
                  onToggle: (index) {
                    if (kDebugMode) {
                      print('switched to: $index');
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
