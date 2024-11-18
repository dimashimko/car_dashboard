import 'package:car_dashboard/resources/app_colors.dart';
import 'package:flutter/material.dart';

class PlanerEventParticipantCard extends StatelessWidget {
  const PlanerEventParticipantCard({
    super.key,
    this.backgroundColor,
    this.paddingColor,
    required this.child,
  });

  final Color? backgroundColor;
  final Color? paddingColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.0,
      height: 32.0,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: paddingColor ?? AppColors.white,
          width: 2,
        ),
      ),
      child: ClipOval(
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
