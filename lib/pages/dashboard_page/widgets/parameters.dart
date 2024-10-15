import 'package:flutter/material.dart';

import '../../../generated/assets.gen.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/theme/custom_theme_extension.dart';
import 'parameter_item.dart';

class Parameters extends StatelessWidget {
  const Parameters({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 12.0,
      spacing: 12.0,
      alignment: WrapAlignment.spaceBetween,
      children: [
        ParameterItem(
          icon: Assets.icons.energy.svg(),
          title: 'Range',
          percent: 45.0,
          arcColor: AppColors.gray.white,
          arcBackgroundColor: AppColors.lightPurple,
          textColor: AppColors.gray.white,
          backgroundColor: AppColors.primary.purple,
        ),
        ParameterItem(
          icon: Assets.icons.range.svg(),
          title: 'Range',
          percent: 57.0,
          arcColor: AppColors.rangeColor,
          arcBackgroundColor: colors(context).arcBackground,
          textColor: colors(context).parametersTextColor,
          backgroundColor: colors(context).background,
        ),
        ParameterItem(
          icon: Assets.icons.breakFluid.svg(),
          title: 'Break fluid',
          percent: 9.0,
          arcColor: AppColors.primary.purple,
          arcBackgroundColor: colors(context).arcBackground,
          textColor: colors(context).parametersTextColor,
          backgroundColor: colors(context).background,
        ),
        ParameterItem(
          icon: Assets.icons.tireWear.svg(),
          title: 'Tire Wear',
          percent: 25.0,
          arcColor: AppColors.secondary.yellow,
          arcBackgroundColor: colors(context).arcBackground,
          textColor: colors(context).parametersTextColor,
          backgroundColor: colors(context).background,
        ),
      ],
    );
  }
}
