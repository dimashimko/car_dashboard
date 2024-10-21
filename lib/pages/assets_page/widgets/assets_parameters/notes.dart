import 'package:car_dashboard/models/enums/enums.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../resources/theme/custom_theme_extension.dart';
import 'note_card.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

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
          horizontal: 20.0,
          vertical: 13.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Notes ',
              style: AppTypography.headingH3.copyWith(
                color: colors(context).parametersTextColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const Gap(16.0),
            SeparatedColumn(
              children: const [
                NoteCard(
                  noteType: NoteType.notification,
                  title: 'Monday, 6th Apirl 2020',
                  text: 'Book for General Service',
                  isCompleted: true,
                  date: 'COMPLETED',
                ),
                NoteCard(
                  noteType: NoteType.warning,
                  title: 'Thursday, 24th October 2021',
                  text: 'Vehicle LV 001 has been marked for recall.',
                  isCompleted: false,
                  date: '14:07-21/11/2021',
                ),
                NoteCard(
                  noteType: NoteType.settings,
                  title: 'Monday, 13th August 2018',
                  text: 'Maintenance Completed, Collect',
                  isCompleted: false,
                  date: '14:07-21/11/2021',
                ),
              ],
              separatorBuilder: () {
                return const SizedBox(
                  height: 18,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
