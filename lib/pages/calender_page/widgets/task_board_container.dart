import 'package:flutter/material.dart';

import '../../../resources/app_colors.dart';
import 'stripe_painter.dart';

class TaskBoardContainer extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Color? calendarEventColor;

  final Widget? child;

  const TaskBoardContainer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 10.0,
    this.calendarEventColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return calendarEventColor == null
        ? SizedBox(
            width: width,
            height: height,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  borderRadius,
                ),
              ),
              child: CustomPaint(
                painter: StripePainter(
                  baseColor: AppColors.grayishWhite,
                  stripeColor: AppColors.white,
                  stripeWidth: 24.0,
                  gapWidth: 20.0,
                  angle: 45.0,
                ),
                child: child,
              ),
            ),
          )
        : Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: calendarEventColor,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  borderRadius,
                ),
              ),
            ),
            child: child,
          );
  }
}
