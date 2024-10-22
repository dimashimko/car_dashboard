import 'package:car_dashboard/generated/assets.gen.dart';
import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../resources/app_typography.dart';

class SensorCard extends StatelessWidget {
  const SensorCard({
    super.key,
    required this.name,
    required this.unit,
    required this.value,
    required this.onChanged,
  });

  final String name;
  final String unit;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Row(
        children: [
          value
              ? Assets.icons.checkboxOn.svg()
              : Assets.icons.checkboxOff.svg(),
          const Gap(10.0),
          Expanded(
            child: Text.rich(
              TextSpan(
                text: '$name ',
                style: AppTypography.title13m.copyWith(
                  color: value
                      ? colors(context).assetsSensorColor
                      : colors(context).parametersTextColor,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: unit,
                    style: AppTypography.title13m.copyWith(
                      color: value
                          ? colors(context).assetsSensorColor
                          : AppColors.gray.dark3,
                    ),
                  ),
                ],
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Assets.icons.analyze.svg(
            colorFilter: ColorFilter.mode(
              value ? colors(context).assetsSensorColor : AppColors.gray.dark6,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
