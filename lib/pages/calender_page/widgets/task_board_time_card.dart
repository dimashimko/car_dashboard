import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../resources/app_typography.dart';

class TaskBoardTimeCard extends StatelessWidget {
  const TaskBoardTimeCard({
    super.key,
    required this.time,
    required this.timeWidth,
    required this.scaleFactor,
  });

  final String time;
  final double timeWidth;
  final double scaleFactor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: timeWidth,
              height: scaleFactor,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: colors(context).dividerSensor,
                    width: 1.0,
                  ),
                  bottom: BorderSide(
                    color: colors(context).dividerSensor,
                    width: 1.0,
                  ),
                ),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  time,
                  style: AppTypography.title12m.copyWith(
                    color: colors(context).textGray,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: scaleFactor / 2,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: colors(context).dividerSensor,
                          width: 1.0, // Set the width of the border
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: scaleFactor / 2,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: colors(context).dividerSensor,
                          width: 1.0, // Set the width of the border
                        ),
                      ),
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
