import 'package:car_dashboard/pages/assets_page/widgets/assets_parameters/reminder_card.dart';
import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../models/reminder.dart';
import '../../../../resources/theme/custom_theme_extension.dart';

class ReminderTable extends StatefulWidget {
  const ReminderTable({
    super.key,
  });

  @override
  State<ReminderTable> createState() => _ReminderTableState();
}

class _ReminderTableState extends State<ReminderTable> {
  Reminder reminderTitle = Reminder(
    description: 'Description',
    due: 'Due',
    overdue: 'Overdue',
    notify: 'Notify',
    status: 'Status',
  );
  List<Reminder> reminders = [
    Reminder(
      description: 'Urgent Safety Recall',
      due: '06/04/2022',
      overdue: '08/04/2022',
      notify: 'David Demo',
      status: 'Completed',
    ),
    Reminder(
      description: 'Urgent Safety Recall',
      due: '06/04/2022',
      overdue: '08/04/2022',
      notify: 'David Demo',
      status: 'Completed',
    ),
  ];

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
          vertical: 16.0,
          horizontal: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Reminder',
                  style: AppTypography.title18M.copyWith(
                    color: colors(context).parametersTextColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primary.purple,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 6,
                      ),
                      child: Text(
                        '+ Add New',
                        style: AppTypography.title14m.copyWith(
                          color: AppColors.gray.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(14.0),
            Divider(
              color: colors(context).dividerSensor,
            ),
            const Gap(10.0),
            ListView.separated(
              itemCount: reminders.length + 1,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, __) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Divider(
                    color: colors(context).dividerSensor,
                  ),
                );
              },
              itemBuilder: (context, index) {
                if (index == 0) {
                  return ReminderCard(
                    isTitle: true,
                    reminder: reminderTitle,
                  );
                }
                return ReminderCard(
                  reminder: reminders[index - 1],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
