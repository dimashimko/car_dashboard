import 'package:car_dashboard/resources/app_typography.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../resources/theme/custom_theme_extension.dart';
import '../../../../widgets/uncategorized/splash_box.dart';

class AddServiceButton extends StatelessWidget {
  const AddServiceButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DottedBorder(
          color: colors(context).addServicesButtonBorderColor,
          padding: EdgeInsets.zero,
          borderType: BorderType.RRect,
          radius: const Radius.circular(8.0),
          dashPattern: const [3, 3],
          strokeWidth: 1,
          child: Container(
            height: 56.0,
            decoration: BoxDecoration(
              color: colors(context).addServicesButtonColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                'Add Services',
                style: AppTypography.headingH3.copyWith(
                  color: colors(context).textSecondarySelected,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        SplashBox(
          borderRadius: BorderRadius.circular(8.0),
          onTap: onTap,
        ),
      ],
    );
  }
}
