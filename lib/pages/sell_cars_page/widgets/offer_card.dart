import 'package:car_dashboard/generated/assets.gen.dart';
import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../models/offer.dart';
import 'impression_share.dart';
import 'offer_card_title.dart';
import 'offer_parameter.dart';
import 'radial_bar.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    super.key,
    required this.offer,
  });

  final Offer offer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors(context).background,
        borderRadius: const BorderRadius.all(
          Radius.circular(14.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 23.0,
          horizontal: 29.0,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: constraints.maxWidth),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OfferCardTitle(
                      offer: offer,
                    ),
                    const Gap(16.0),
                    ImpressionShare(
                      offer: offer,
                    ),
                    RadialBar(
                      offer: offer,
                    ),
                    OfferParameter(
                      iconPath: Assets.icons.car.path,
                      amount: 1174.0,
                      title: 'Model Spend',
                      color: AppColors.offerBlue,
                    ),
                    OfferParameter(
                      iconPath: Assets.icons.arrowBoldForvard.path,
                      amount: 1174.0,
                      title: 'Model Spend',
                      color: AppColors.secondary.red,
                    ),
                    OfferParameter(
                      iconPath: Assets.icons.dollarSign.path,
                      amount: 811.0,
                      title: 'Spend per Unit Turned',
                      color: AppColors.primary.purple,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
