import 'package:car_dashboard/resources/app_typography.dart';
import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class OfferParameter extends StatelessWidget {
  const OfferParameter({
    super.key,
    required this.iconPath,
    required this.amount,
    required this.title,
    required this.color,
  });

  final String iconPath;
  final double amount;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36.0,
            height: 36.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: color.withOpacity(0.1),
            ),
            child: Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                iconPath,
              ),
            ),
          ),
          Text(
            '\$${NumberFormat('#,###').format(amount)}',
            style: AppTypography.headingH3.copyWith(
              color: color,
            ),
          ),
          Text(
            title,
            style: AppTypography.title12m.copyWith(
              color: colors(context).offerParameters,
            ),
          ),
        ],
      ),
    );
  }
}
