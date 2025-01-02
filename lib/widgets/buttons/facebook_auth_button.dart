import 'package:auto_size_text/auto_size_text.dart';
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
        decoration: const BoxDecoration(
          color: AppColors.facebookColor,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap(16.0),
            Assets.icons.logoFacebook.svg(),
            const Gap(8.0),
            Expanded(
              child: AutoSizeText(
                'Sign in with Facebook',
                style: AppTypography.title16m.copyWith(
                  color: AppColors.gray.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
