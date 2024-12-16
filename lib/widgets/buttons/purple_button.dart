import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/uncategorized/splash_box.dart';

class PurpleButton extends StatelessWidget {
  const PurpleButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 59.0,
          decoration: BoxDecoration(
            color: AppColors.primary.purple,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              text,
              style: AppTypography.headingH3.copyWith(
                color: AppColors.gray.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        SplashBox(
          borderRadius: BorderRadius.circular(8.0),
          onTap: onTap,
        ),
      ],
    );
  }
}
