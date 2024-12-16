import 'package:car_dashboard/widgets/common/row_scrollable.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../generated/assets.gen.dart';
import '../../resources/app_typography.dart';
import '../../resources/theme/custom_theme_extension.dart';

class GoogleAuthButton extends StatelessWidget {
  const GoogleAuthButton({
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
          // color: AppColors.surface.surface,
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
          border: Border.all(
            color: colors(context).googleAuthButton,
            width: 1,
          ),
        ),
        child: RowScrollable(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.icons.logoGoogle.svg(),
            const Gap(8.0),
            Text(
              'Sign in with Google',
              style: AppTypography.title16m.copyWith(
                color: colors(context).notesStatusBannerText,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
