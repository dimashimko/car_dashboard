import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../resources/app_typography.dart';

class PlanerTimeCard extends StatelessWidget {
  const PlanerTimeCard({
    super.key,
    required this.time,
    required this.timeWidth,
  });

  final String time;
  final double timeWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: timeWidth,
              child: Text(
                time,
                style: AppTypography.title14m.copyWith(
                  color: colors(context).textGray,
                ),
              ),
            ),
            Gap(8.0),
            Expanded(
              child: Container(
                color: Colors.grey,
                width: double.infinity,
                height: 1.0,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}
