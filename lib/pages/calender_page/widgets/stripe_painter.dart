import 'dart:math' as math;

import 'package:flutter/material.dart';

class StripePainter extends CustomPainter {
  final Color baseColor;
  final Color stripeColor;
  final double stripeWidth;
  final double gapWidth;
  final double angle;

  StripePainter({
    required this.baseColor,
    required this.stripeColor,
    required this.stripeWidth,
    required this.gapWidth,
    required this.angle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Paint for the base color
    final basePaint = Paint()..color = baseColor;

    // Fill the background
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      basePaint,
    );

    // Paint for the stripes
    final stripePaint = Paint()
      ..color = stripeColor
      ..style = PaintingStyle.fill;

    // Calculate the total width needed for one stripe + gap
    final totalWidth = stripeWidth + gapWidth;

    // Calculate how many stripes we need to cover the entire container
    // We add extra stripes to cover the corners when rotated
    final diagonal =
        math.sqrt(size.width * size.width + size.height * size.height);
    final numberOfStripes = (diagonal / totalWidth).ceil() + 2;

    // Save the current canvas state
    canvas.save();

    // Move to center of the container
    canvas.translate(size.width / 2, size.height / 2);

    // Rotate the canvas
    canvas.rotate(angle * math.pi / 180);

    // Move back to cover the entire area
    canvas.translate(-diagonal / 2, -diagonal / 2);

    // Draw the stripes
    for (var i = 0; i < numberOfStripes; i++) {
      final x = i * totalWidth;
      canvas.drawRect(
        Rect.fromLTWH(x, -size.height, stripeWidth, diagonal * 2),
        stripePaint,
      );
    }

    // Restore the canvas state
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
