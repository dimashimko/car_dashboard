import 'package:car_dashboard/widgets/common/row_scrollable.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../generated/assets.gen.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_typography.dart';

class FacebookAuthButton extends StatelessWidget {
  const FacebookAuthButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8.0),
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 246.0,
        decoration: BoxDecoration(
          color: AppColors.facebookColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: RowScrollable(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.icons.logoFacebook.svg(),
            const Gap(8.0),
            Text(
              'Sign in with Facebook',
              style: AppTypography.title16m.copyWith(
                color: AppColors.gray.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
