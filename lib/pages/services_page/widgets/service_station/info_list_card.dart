import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../models/service_order.dart';
import '../../../../resources/theme/custom_theme_extension.dart';

class InfoListCard extends StatelessWidget {
  const InfoListCard({
    super.key,
    required this.serviceOrder,
  });

  final ServiceOrder serviceOrder;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors(context).background,
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          children: [
            const Gap(14.0),
            Container(
              width: 16.0,
              height: 16.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: serviceOrder.color,
              ),
            ),
            const Gap(14.0),
            Expanded(
              child: Text(
                serviceOrder.name,
                style: AppTypography.headingH3.copyWith(
                  color: colors(context).textSecondarySelected,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              width: 64.0,
              height: 30.0,
              decoration: BoxDecoration(
                color: AppColors.primary.purple.withOpacity(0.1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Center(
                child: Text(
                  '\$${serviceOrder.price.round()}',
                  style: AppTypography.headingH3.copyWith(
                    color: AppColors.primary.purple,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const Gap(11.0),
          ],
        ),
      ),
    );
  }
}
