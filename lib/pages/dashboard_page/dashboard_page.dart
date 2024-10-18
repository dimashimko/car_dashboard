import 'package:car_dashboard/pages/dashboard_page/widgets/statistics/statistics.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'widgets/cars_panel/cars_panel.dart';
import 'widgets/parameters/parameters.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Parameters(),
                const Gap(23.0),
                const Statistics(),
                const Gap(23.0),
                CarsPanel(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
