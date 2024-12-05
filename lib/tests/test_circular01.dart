import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: CustomPaint(
            size: const Size(200, 200), // Adjust size as needed
            painter: CircularPainter(),
          ),
        ),
      ),
    );
  }
}

class CircularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    final circleRadius = size.width / 2;

    // Draw the green arc
    paint.color = Colors.green;
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(circleRadius, circleRadius), radius: circleRadius),
      0,
      2.5, // Adjust angle
      false,
      paint,
    );

    // Draw the purple arc
    paint.color = Colors.purple;
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(circleRadius, circleRadius), radius: circleRadius),
      2.5,
      1.0, // Adjust angle
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
