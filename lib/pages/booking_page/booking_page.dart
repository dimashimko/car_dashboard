import 'package:car_dashboard/pages/booking_page/widgets/booking_parameter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../generated/assets.gen.dart';
import '../../resources/app_typography.dart';
import '../../resources/theme/custom_theme_extension.dart';
import 'widgets/booking_dropdown.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Text(
                  'Booking',
                  style: AppTypography.headingH1.copyWith(
                    color: colors(context).parametersTextColor,
                  ),
                ),
                const Gap(30.0),
                Row(
                  children: [
                    const BookingDropdown(
                      text: 'New',
                    ),
                    const Gap(16.0),
                    const BookingDropdown(
                      text: 'Toyota',
                    ),
                    const Gap(16.0),
                    Spacer(),
                    BookingParameter(
                      iconPath: Assets.icons.grid.path,
                    ),
                    const Gap(16.0),
                    BookingParameter(
                      iconPath: Assets.icons.settings.path,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
