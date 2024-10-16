import 'package:flutter/material.dart';

import 'car_statistic.dart';
import 'miles_statistic.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      runSpacing: 12.0,
      spacing: 12.0,
      alignment: WrapAlignment.spaceBetween,
      children: [
        MilesStatistic(),
        CarStatistic(),
      ],
    );
  }
}
