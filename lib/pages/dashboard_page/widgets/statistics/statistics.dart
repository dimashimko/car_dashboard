import 'package:car_dashboard/pages/dashboard_page/widgets/statistics/miles_statistic.dart';
import 'package:flutter/material.dart';

import 'car_statistic.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 2,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 800.0,
        mainAxisExtent: 332.0,
        crossAxisSpacing: 30.0,
        mainAxisSpacing: 30.0,
      ),
      itemBuilder: (context, index) {
        if (index == 0) return const MilesStatistic();
        return const CarStatistic();
      },
    );
  }
}
