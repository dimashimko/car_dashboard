import 'package:car_dashboard/resources/app_typography.dart';
import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';

import '../../../../models/reminder.dart';

class ReminderCard extends StatelessWidget {
  const ReminderCard({
    super.key,
    this.isTitle = false,
    required this.reminder,
  });

  final bool isTitle;
  final Reminder reminder;

  TextStyle getStyle(BuildContext context) {
    return isTitle
        ? AppTypography.title14m.copyWith(
            color: colors(context).textGray,
          )
        : AppTypography.title13m.copyWith(
            color: colors(context).notesStatusBannerText,
          );
  }

  @override
  Widget build(BuildContext context) {
    return SeparatedRow(
      separatorBuilder: () => const SizedBox(
        width: 8.0,
      ),
      children: [
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: Text(
            reminder.description,
            style: getStyle(context),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: Text(
            reminder.due,
            style: getStyle(context),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: Text(
            reminder.overdue,
            style: getStyle(context),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: Text(
            reminder.notify,
            style: getStyle(context),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: Text(
            reminder.status,
            style: getStyle(context),
          ),
        ),
      ],
    );
  }
}
