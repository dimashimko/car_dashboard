import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/offer.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_typography.dart';
import '../../../resources/theme/custom_theme_extension.dart';
import 'impression_share_arc_painter.dart';

class ImpressionShare extends StatelessWidget {
  const ImpressionShare({
    super.key,
    required this.offer,
    this.size = 93,
  });

  final Offer offer;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: size,
          width: size,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomPaint(
                size: Size(size, size),
                painter: ImpressionShareArcPainter(
                  percentValue: offer.impressionShare,
                  arcColor: AppColors.secondary.green,
                  arcBackgroundColor: colors(context).arcBackground,
                ),
              ),
              Text(
                'Excellent',
                style: AppTypography.title14b.copyWith(
                  fontSize: 10.0,
                  color: AppColors.secondary.green,
                ),
              ),
              Center(
                child: Text(
                  '${NumberFormat('#,###').format(offer.impressionShare)}%',
                  style: AppTypography.title16b.copyWith(
                    color: colors(context).parametersTextColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          'Impression Share',
          style: AppTypography.title14b.copyWith(
            color: colors(context).bookingPassengerText,
          ),
        ),
      ],
    );
  }
}
