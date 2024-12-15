import 'package:car_dashboard/resources/app_colors.dart';
import 'package:flutter/material.dart';

class IsOnlineIndicator extends StatelessWidget {
  const IsOnlineIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12.0,
      height: 12.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.isOnlineIndicatorBackground,
      ),
      child: Center(
        child: Container(
          width: 8.0,
          height: 8.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.isOnlineIndicator,
          ),
        ),
      ),
    );
  }
}
