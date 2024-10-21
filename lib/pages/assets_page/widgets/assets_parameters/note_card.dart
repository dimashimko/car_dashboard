import 'package:car_dashboard/generated/assets.gen.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../models/enums/enums.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.noteType,
    required this.title,
    required this.text,
    required this.isCompleted,
    required this.date,
  });

  final NoteType noteType;
  final String title;
  final String text;
  final bool isCompleted;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 44.0,
          width: 44.0,
          decoration: BoxDecoration(
            color: colors(context).notesCardIcon,
            borderRadius: BorderRadius.circular(22.0),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0.0, 2.0),
                blurRadius: 4.0,
                color: colors(context).notesCardShadow,
              ),
            ],
          ),
          child: Builder(builder: (context) {
            if (noteType == NoteType.notification) {
              return Center(
                child: Assets.icons.notification.svg(),
              );
            }
            if (noteType == NoteType.warning) {
              return Center(
                child: Assets.icons.warning.svg(),
              );
            }
            return Center(
              child: Assets.icons.setting.svg(),
            );
          }),
        ),
        const Gap(14.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.title13m.copyWith(
                  color: colors(context).parametersTextColor,
                ),
              ),
              Text(
                text,
                style: AppTypography.title11R.copyWith(
                  color: colors(context).textGray,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
