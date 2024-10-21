import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../resources/app_typography.dart';
import '../../resources/theme/custom_theme_extension.dart';
import '../../utils/constants.dart';
import 'widgets/assets_parameters/assets_parameters.dart';
import 'widgets/car_widget/car_widget.dart';

class AssetsPage extends StatelessWidget {
  const AssetsPage({super.key});

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
                  'Assets',
                  style: AppTypography.headingH1.copyWith(
                    color: colors(context).parametersTextColor,
                  ),
                ),
                const Gap(16.0),
                LayoutBuilder(
                  builder: (context, constraints) {
                    double availableWidth = constraints.maxWidth;

                    if (availableWidth > minWidthForExpandedAssets) {
                      return const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: CarWidget(),
                          ),
                          Gap(24.0),
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 2,
                            child: AssetsParameters(),
                          ),
                        ],
                      );
                    } else {
                      return const Column(
                        children: [
                          CarWidget(),
                          AssetsParameters(),
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
