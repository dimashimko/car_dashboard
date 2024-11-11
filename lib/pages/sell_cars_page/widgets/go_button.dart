import 'package:car_dashboard/generated/assets.gen.dart';
import 'package:car_dashboard/resources/app_colors.dart';
import 'package:flutter/material.dart';

class GoButton extends StatelessWidget {
  const GoButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 20.0,
        width: 48.0,
        decoration: BoxDecoration(
          color: AppColors.secondary.red,
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Center(
          child: Assets.icons.arrowWhiteRigth.svg(),
        ),
      ),
    );
  }
}
