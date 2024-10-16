import 'dart:math';

import 'package:flutter/material.dart';

class CircularChart extends StatelessWidget {
  const CircularChart({
    super.key,
    required this.percentValue,
    required this.arcColor,
    required this.arcBackgroundColor,
  });

  final double percentValue;
  final Color arcColor;
  final Color arcBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(112, 112),
      painter: ArcPainter(
        percentValue: percentValue,
        arcColor: arcColor,
        arcBackgroundColor: arcBackgroundColor,
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  const ArcPainter({
    required this.percentValue,
    required this.arcColor,
    required this.arcBackgroundColor,
  });

  final double percentValue;
  final Color arcColor;
  final Color arcBackgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final Paint paintBackground = Paint()
      ..color = arcBackgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    final Paint paintArc = Paint()
      ..color = arcColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    const double startAngle = 135 * pi / 180;
    final double sweepAngle = ((percentValue / 100) * 270) * pi / 180;

    canvas.drawArc(
      rect,
      startAngle,
      pi * 1.5,
      false,
      paintBackground,
    );

    canvas.drawArc(
      rect,
      startAngle,
      sweepAngle,
      false,
      paintArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
