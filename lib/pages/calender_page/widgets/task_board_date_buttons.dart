import 'package:car_dashboard/generated/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../../resources/app_colors.dart';

class TaskBoardDateButtons extends StatelessWidget {
  const TaskBoardDateButtons({
    super.key,
    required this.onTapLeft,
    required this.onTapRight,
  });

  final VoidCallback onTapLeft;
  final VoidCallback onTapRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33.0,
      decoration: BoxDecoration(
        color: AppColors.secondary.onBlue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 7.0,
        ),
        child: Row(
          children: [
            InkWell(
              onTap: onTapLeft,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Assets.icons.arrowLeft.svg(),
              ),
            ),
            InkWell(
              onTap: onTapRight,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Assets.icons.arrowRigth.svg(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
