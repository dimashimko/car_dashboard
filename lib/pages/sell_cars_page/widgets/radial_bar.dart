import 'dart:math';

import 'package:car_dashboard/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../models/offer.dart';
import '../../../resources/app_typography.dart';
import '../../../resources/theme/custom_theme_extension.dart';

class RadialBar extends StatelessWidget {
  const RadialBar({
    super.key,
    required this.offer,
  });

  final Offer offer;

  List<ChartData> _getChartData() {
    return [
      ChartData('Category A', offer.p1),
      ChartData('Category B', offer.p2),
      ChartData('Category C', offer.p3),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox.square(
          dimension: 98.0,
          child: Transform.rotate(
            angle: ((pi * 16) / 180) * -1,
            child: SfCircularChart(
              margin: EdgeInsets.zero,
              palette: [
                AppColors.secondary.yellow,
                AppColors.secondary.red,
                AppColors.primary.purple,
              ],
              series: <CircularSeries>[
                RadialBarSeries<ChartData, String>(
                  dataSource: _getChartData(),
                  xValueMapper: (ChartData data, _) => data.category,
                  yValueMapper: (ChartData data, _) => data.value,
                  cornerStyle: CornerStyle.bothCurve,
                  maximumValue: 100,
                  innerRadius: '50%',
                  radius: '100%',
                  gap: '14%',
                  animationDuration: 200,
                ),
              ],
            ),
          ),
        ),
        Text(
          '\$${NumberFormat('#,###').format(offer.pSum)}',
          style: AppTypography.title16b.copyWith(
            color: colors(context).parametersTextColor,
          ),
        )
      ],
    );
  }
}

class ChartData {
  ChartData(this.category, this.value);

  final String category;
  final double value;
}
