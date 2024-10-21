import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../generated/assets.gen.dart';
import 'pair_car_parameter.dart';

class CarWidget extends StatelessWidget {
  const CarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double availableWidth = constraints.maxWidth;
        double height = availableWidth * 2.27;
        double textHeight = 189;
        double carHeight = (height - textHeight);
        double containerHeight = carHeight * 0.75 + textHeight;

        return SizedBox(
          height: height,
          child: Stack(
            children: [
              Container(
                height: containerHeight,
                decoration: BoxDecoration(
                  color: colors(context).carWidgetBackground,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(14.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 23.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Gap(31.0),
                    // SizedBox(
                    //   width: double.infinity,
                    // ),
                    const PairCarParameter(
                      firstTitle: 'Fuel Usage',
                      firstValue: '2903.89 Ltr',
                      secondTitle: 'KM Driven',
                      secondValue: '2903.89 Ltr',
                    ),
                    const Gap(25.0),
                    const PairCarParameter(
                      firstTitle: 'Total Cost',
                      firstValue: '\$3,00,290.00',
                      secondTitle: 'Top Speed',
                      secondValue: '\$5.2K',
                    ),
                    const Gap(48.0),
                    Expanded(
                      child: Assets.images.carAssets.image(
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
