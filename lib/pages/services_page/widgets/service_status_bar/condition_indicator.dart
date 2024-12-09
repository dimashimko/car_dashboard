import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';

class ConditionIndicator extends StatelessWidget {
  const ConditionIndicator({
    super.key,
    required this.conditionValue,
    required this.indicatorColor,
    this.indicatorWidth = 180.0,
  });

  final Color indicatorColor;
  final double conditionValue;
  final double indicatorWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: indicatorWidth,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          // Background of the condition indicator
          Container(
            height: 3.0,
            decoration: BoxDecoration(
              color: colors(context).conditionIndicatorBackground,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          Builder(
            builder: (context) {
              double clampedCondition = conditionValue.clamp(0.0, 100.0);
              double filledWidth = (indicatorWidth / 100) * clampedCondition;

              return Container(
                height: 5.0,
                width: filledWidth,
                decoration: BoxDecoration(
                  color: indicatorColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
