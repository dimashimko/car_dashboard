import 'package:car_dashboard/generated/assets.gen.dart';
import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:car_dashboard/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TaskBoardDate extends StatelessWidget {
  const TaskBoardDate({
    super.key,
    required this.dateTime,
    required this.onChangeDateTime,
  });

  final DateTime dateTime;
  final ValueChanged<DateTime> onChangeDateTime;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DateTime? newDateTime = await showDatePicker(
          context: context,
          initialDate: dateTime,
          firstDate: DateTime.now().subtract(
            const Duration(days: 31),
          ),
          lastDate: DateTime.now().add(
            const Duration(days: 31),
          ),
        );
        if (newDateTime != null) {
          onChangeDateTime(newDateTime);
        }
      },
      child: Container(
        height: 33.0,
        decoration: BoxDecoration(
          color: AppColors.secondary.onBlue,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 6.0,
          ),
          child: Row(
            children: [
              Assets.icons.calendar.svg(),
              const Gap(6.0),
              Text(
                dateTime.toFormattedString,
                style: AppTypography.title16m.copyWith(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
