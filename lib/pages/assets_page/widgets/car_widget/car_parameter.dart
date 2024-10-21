import 'package:car_dashboard/resources/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../resources/app_typography.dart';

class CarParameter extends StatelessWidget {
  const CarParameter({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.title16m.copyWith(
            color: AppColors.carWidgetTextLight,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          value,
          style: AppTypography.headingH3.copyWith(
            color: AppColors.white,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
