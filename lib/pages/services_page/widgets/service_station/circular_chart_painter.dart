import 'dart:math';

import 'package:flutter/material.dart';

class CircularChartPainter extends CustomPainter {
  CircularChartPainter({
    required this.numberOfPoints,
    required this.colorMap,
  });

  final int numberOfPoints;
  final List<Color> colorMap;

  @override
  void paint(Canvas canvas, Size size) {
    const double smallCircleRadius = 8.0;
    double strokeWidth = 6;
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double r = size.width / 2 - 20;
    double arcLength = (2 * pi) / numberOfPoints;

    double l = 2 * pi * r;
    double lN = l / numberOfPoints;
    double lNew = lN - smallCircleRadius;
    double arcPadding = lNew / r;

    for (int i = 0; i < numberOfPoints; i++) {
      final paint = Paint()
        ..color = colorMap[i % colorMap.length]
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth;
      double angle = arcLength * i;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: r),
        angle + arcPadding,
        arcLength - arcPadding * 2,
        false,
        paint,
      );
    }

    for (int i = 0; i < numberOfPoints; i++) {
      final paint = Paint()
        ..color = colorMap[(i - 1) % colorMap.length]
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth;
      double angle = arcLength * i;

      final jointPoint = Offset(
        center.dx + r * cos(angle),
        center.dy + r * sin(angle),
      );

      canvas.drawCircle(jointPoint, smallCircleRadius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
