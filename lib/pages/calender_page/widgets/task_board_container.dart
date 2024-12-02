import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Container(
                decoration: BoxDecoration(
                  color: colors(context).stripeContainerBorderColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          borderRadius,
                        ),
                      ),
                    ),
                    child: CustomPaint(
                      painter: StripePainter(
                        baseColor: colors(context).stripeContainerBaseColor,
                        stripeColor: colors(context).stripeContainerStripeColor,
                        stripeWidth: 24.0,
                        gapWidth: 20.0,
                        angle: 45.0,
                      ),
                      child: child,
                    ),
                  ),
                ),
              ),
            ),
          )
        : SizedBox(
            width: width,
            height: height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Container(
                decoration: BoxDecoration(
                  color: calendarEventColor?.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: calendarEventColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        borderRadius,
                      ),
                    ),
                  ),
                  child: child,
                ),
              ),
            ),
          );
  }
}
