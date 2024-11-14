import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../resources/app_typography.dart';
import '../../../resources/theme/custom_theme_extension.dart';
import 'custom_calendar.dart';

class CalendarFirstPart extends StatelessWidget {
  const CalendarFirstPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Calendar',
          style: AppTypography.headingH1.copyWith(
            color: colors(context).parametersTextColor,
          ),
        ),
        const Gap(16.0),
        CustomCalendar(
          initialDate: DateTime.now().add(
            const Duration(days: 0),
          ),
          onDateSelected: (DateTime dateTime) {},
          isShowAdjacentDays: false,
        ),
        const Gap(16.0),
      ],
    );
  }
}
