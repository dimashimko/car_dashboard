import 'package:car_dashboard/pages/sell_cars_page/widgets/car_preview.dart';
import 'package:car_dashboard/pages/sell_cars_page/widgets/tracking_history.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../resources/app_typography.dart';
import '../../resources/theme/custom_theme_extension.dart';
import '../../utils/constants.dart';

class SellCarsPage extends StatelessWidget {
  const SellCarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sell Cars',
                  style: AppTypography.headingH1.copyWith(
                    color: colors(context).parametersTextColor,
                  ),
                ),
                const Gap(16.0),
                LayoutBuilder(
                  builder: (context, constraints) {
                    double availableWidth = constraints.maxWidth;

                    if (availableWidth > minWidthForExpandedSellCars) {
                      return const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 2,
                            child: CarPreview(),
                          ),
                          Gap(24.0),
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: TrackingHistory(),
                          ),
                        ],
                      );
                    } else {
                      return const Column(
                        children: [
                          // CarPreview(),
                          Gap(27.0),
                          TrackingHistory(),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
