import 'package:car_dashboard/pages/dashboard_page/widgets/parameters/parameters.dart';
import 'package:car_dashboard/pages/dashboard_page/widgets/statistics/statistics.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../resources/theme/custom_theme_extension.dart';

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
                Text(
                  'DashboardPage',
                  style: TextStyle(
                    color: colors(context).textPrimary,
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 16.0,
                ),
                const Parameters(),
                const Gap(23.0),
                const Statistics(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
