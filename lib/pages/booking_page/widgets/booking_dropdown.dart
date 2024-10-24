import 'package:car_dashboard/generated/assets.gen.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookingDropdown extends StatelessWidget {
  const BookingDropdown({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors(context).background,
        borderRadius: const BorderRadius.all(
          Radius.circular(22.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 6.0,
        ),
        child: Row(
          children: [
            Text(
              text,
              style: AppTypography.title16m.copyWith(
                color: colors(context).bookingDropdown,
              ),
            ),
            const Gap(23.0),
            Assets.icons.dropDown.svg(),
          ],
        ),
      ),
    );
  }
}
