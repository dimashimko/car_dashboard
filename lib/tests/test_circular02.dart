import 'package:car_dashboard/pages/services_page/widgets/service_station/circular_chart_painter.dart';
import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

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
        body: CustomPaint(
          painter: CircularChartPainter(
            numberOfPoints: 3,
            colorMap: [
              AppColors.primary.purple,
              AppColors.secondary.red,
              AppColors.secondary.green,
            ],
          ),
        ),
      ),
    );
  }
}
