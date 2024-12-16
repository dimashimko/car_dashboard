import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';

class PartsBarCard extends StatelessWidget {
  const PartsBarCard({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35.0,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.purple.withOpacity(0.1)
              : AppColors.transparent,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14.0,
              vertical: 6.0,
            ),
            child: Text(
              text,
              style: AppTypography.title18M.copyWith(
                color: isSelected
                    ? colors(context).parametersTextColor
                    : colors(context).bookingDropdown,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
