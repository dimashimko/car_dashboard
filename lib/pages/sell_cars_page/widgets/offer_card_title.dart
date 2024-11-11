import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../models/offer.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_typography.dart';
import '../../../resources/theme/custom_theme_extension.dart';
import 'go_button.dart';

class OfferCardTitle extends StatelessWidget {
  const OfferCardTitle({
    super.key,
    required this.offer,
  });

  final Offer offer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          offer.name,
          style: AppTypography.headingH3.copyWith(
            color: colors(context).parametersTextColor,
          ),
        ),
        const Gap(2.0),
        Row(
          children: [
            Text(
              NumberFormat('#,###').format(offer.averagePrice),
              style: AppTypography.title18M.copyWith(
                color: AppColors.secondary.red,
              ),
            ),
            Text(
              ' avarage price',
              style: AppTypography.title12m.copyWith(
                color: colors(context).averagePrice,
              ),
            ),
          ],
        ),
        const Gap(2.0),
        Text(
          'market avarage is \$${NumberFormat('#,###').format(offer.marketAverage)}',
          style: AppTypography.title12m.copyWith(
            color: colors(context).bookingPassengerText,
          ),
        ),
        const Gap(8.0),
        GoButton(onTap: () {}),
        const Gap(4.0),
      ],
    );
  }
}
