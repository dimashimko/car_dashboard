import 'package:car_dashboard/generated/assets.gen.dart';
import 'package:car_dashboard/models/booking_car.dart';
import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../resources/theme/custom_theme_extension.dart';

class BookingCarCard extends StatelessWidget {
  const BookingCarCard({
    super.key,
    required this.bookingCar,
    required this.onChanged,
  });

  final BookingCar bookingCar;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors(context).background,
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    bookingCar.name,
                    style: AppTypography.title18bold.copyWith(
                      color: colors(context).parametersTextColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                InkWell(
                  onTap: () => onChanged(!bookingCar.isSelected),
                  child: bookingCar.isSelected
                      ? Assets.icons.heartOn.svg()
                      : Assets.icons.heartOff.svg(),
                ),
              ],
            ),
            Text(
              bookingCar.classCar,
              style: AppTypography.title16r.copyWith(
                color: AppColors.gray.dark3,
              ),
            ),
            Expanded(
              child: Center(
                child: Image.asset(
                  bookingCar.image,
                ),
              ),
            ),
            Row(
              children: [
                Assets.icons.passengers.svg(),
                const Gap(4.0),
                Text(
                  bookingCar.passengers.toString(),
                  style: AppTypography.title18R.copyWith(
                    color: colors(context).bookingPassengerText,
                  ),
                ),
                const Gap(18.0),
                Assets.icons.returning.svg(),
                const Gap(4.0),
                Text(
                  bookingCar.returningType.toString(),
                  style: AppTypography.title18R.copyWith(
                    color: colors(context).bookingPassengerText,
                  ),
                ),
                const Spacer(),
                Text(
                  '\$${bookingCar.priceForDay}',
                  style: AppTypography.title18M.copyWith(
                    color: colors(context).parametersTextColor,
                  ),
                ),
                Text(
                  '/d',
                  style: AppTypography.title18R.copyWith(
                    color: colors(context).bookingPassengerText,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
