import 'dart:math';

import 'package:flutter/material.dart';

class ImpressionShareArcPainter extends CustomPainter {
  const ImpressionShareArcPainter({
    required this.percentValue,
    required this.arcColor,
    required this.arcBackgroundColor,
    this.strokeWidth = 16.0,
  });

  final double percentValue;
  final Color arcColor;
  final Color arcBackgroundColor;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final double inset = strokeWidth / 2;
    final Rect rect = Rect.fromLTWH(
      inset,
      inset,
      size.width - strokeWidth,
      size.height - strokeWidth,
    );

    final Paint paintBackground = Paint()
      ..color = arcBackgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.square;

    final Paint paintArc = Paint()
      ..color = arcColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.square;

    const double startAngle = (135 * pi) / 180;
    final double sweepAngle = (((pi / 2) * 3) * percentValue) / 100;

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
