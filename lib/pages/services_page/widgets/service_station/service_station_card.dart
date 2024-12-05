import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:car_dashboard/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../models/station.dart';

class ServiceStationCard extends StatelessWidget {
  const ServiceStationCard({
    super.key,
    required this.station,
    required this.maxWidthWidget,
    required this.isCurrent,
    required this.onTap,
  });

  final Station station;
  final double maxWidthWidget;
  final bool isCurrent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isCurrent
              ? AppColors.primary.purple
              : station.isBooked
                  ? AppColors.secondary.red
                  : colors(context).background,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Center(
          child: Text(
            station.name,
            style: AppTypography.headingH3.copyWith(
              fontSize: 16.toResponsive(maxWidthWidget),
              color: isCurrent || station.isBooked
                  ? AppColors.gray.white
                  : colors(context).bookingPassengerText,
            ),
          ),
        ),
      ),
    );
  }
}
