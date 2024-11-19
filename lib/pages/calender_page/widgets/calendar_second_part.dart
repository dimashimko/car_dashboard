import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../resources/app_typography.dart';
import '../../../resources/theme/custom_theme_extension.dart';
import 'task_board.dart';

class CalendarSecondPart extends StatelessWidget {
  const CalendarSecondPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'CalendarSecondPart',
          style: AppTypography.headingH1.copyWith(
            color: colors(context).parametersTextColor,
          ),
        ),
        const Gap(16.0),
        const TaskBoard(),
      ],
    );
  }
}
