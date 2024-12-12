import 'package:car_dashboard/resources/app_typography.dart';
import 'package:flutter/material.dart';

import '../../../../resources/app_colors.dart';

class UnreadMessageIndicator extends StatelessWidget {
  const UnreadMessageIndicator({
    super.key,
    required this.numberOfUnreadMessages,
  });

  final int numberOfUnreadMessages;

  @override
  Widget build(BuildContext context) {
    if (numberOfUnreadMessages == 0) return const SizedBox();
    return Container(
      width: 16.0,
      height: 16.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.secondary.red,
      ),
      child: Center(
        child: Text(
          numberOfUnreadMessages.toString(),
          style: AppTypography.title14b.copyWith(
            fontSize: 12.0,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
