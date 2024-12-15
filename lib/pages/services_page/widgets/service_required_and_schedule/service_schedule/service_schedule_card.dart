import 'package:car_dashboard/generated/assets.gen.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:car_dashboard/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../models/service_schedule.dart';
import '../../../../../widgets/dividers/custom_small_divider.dart';

class ServiceScheduleCard extends StatelessWidget {
  const ServiceScheduleCard({
    super.key,
    required this.serviceSchedule,
    required this.isSelected,
    required this.onTap,
  });

  final ServiceSchedule serviceSchedule;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 9.0,
            ),
            child: isSelected
                ? Assets.icons.radioOn.svg()
                : Assets.icons.radioOff.svg(),
          ),
          const Gap(19.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  serviceSchedule.text,
                  style: AppTypography.title16m.copyWith(
                    color: colors(context).notesStatusBannerText,
                  ),
                ),
                const Gap(16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      serviceSchedule.when,
                      style: AppTypography.title14m.copyWith(
                        color: colors(context).textGray,
                      ),
                    ),
                    const Gap(16.0),
                    const CustomSmallDivider(),
                    const Gap(16.0),
                    Expanded(
                      child: Text(
                        'Fix Price: \$${serviceSchedule.fixPrice.toCurrencyString()}',
                        style: AppTypography.title14m.copyWith(
                          color: colors(context).textGray,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const Gap(20.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
