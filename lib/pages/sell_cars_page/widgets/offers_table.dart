import 'package:car_dashboard/resources/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../resources/theme/custom_theme_extension.dart';
import '../../../models/offer.dart';
import '../../../widgets/dropdown/custom_dropdown.dart';
import 'offer_card.dart';

class OffersTable extends StatefulWidget {
  const OffersTable({
    super.key,
  });

  @override
  State<OffersTable> createState() => _OffersTableState();
}

class _OffersTableState extends State<OffersTable> {
  List<Offer> offer = [
    const Offer(
      name: 'Killan James',
      averagePrice: 16605.0,
      marketAverage: 16224.0,
      impressionShare: 45,
      p1: 55,
      p2: 80,
      p3: 75,
      pSum: 811,
      modelSpendCar: 1174.0,
      modelSpendReturn: 1174.0,
      spendPerUnitTurned: 811.0,
    ),
    const Offer(
      name: 'Killan James',
      averagePrice: 16605.0,
      marketAverage: 16224.0,
      impressionShare: 55,
      p1: 80,
      p2: 55,
      p3: 75,
      pSum: 811,
      modelSpendCar: 1174.0,
      modelSpendReturn: 1174.0,
      spendPerUnitTurned: 811.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Offers',
              style: AppTypography.headingH1.copyWith(
                color: colors(context).parametersTextColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            const CustomDropdown(
              text: 'New',
            ),
            const Gap(16.0),
            const CustomDropdown(
              text: 'Toyota',
            ),
          ],
        ),
        const Gap(30.0),
        ListView.separated(
          itemCount: offer.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return const SizedBox(height: 20.0);
          },
          itemBuilder: (context, index) {
            return OfferCard(
              offer: offer[index],
            );
          },
        ),
      ],
    );
  }
}
