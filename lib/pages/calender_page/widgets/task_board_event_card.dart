import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:car_dashboard/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../models/calendar_event.dart';
import 'task_board_container.dart';

class TaskBoardEventCard extends StatelessWidget {
  const TaskBoardEventCard({
    super.key,
    required this.calendarEvent,
    required this.leftPadding,
    required this.width,
    required this.scaleFactor,
  });

  final CalendarEvent calendarEvent;
  final double leftPadding;
  final double width;
  final double scaleFactor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: leftPadding,
      ),
      child: TaskBoardContainer(
        width: width,
        height: calendarEvent.endTime
            .difference(
              calendarEvent.startTime,
            )
            .toHeight(
              scaleFactor,
            ),
        calendarEventColor: calendarEvent.color,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              calendarEvent.startTime.toHourMinuteAmPm,
                              style: AppTypography.title12m.copyWith(
                                color: calendarEvent.color == null
                                    ? AppColors.primary.dark1
                                    : AppColors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            calendarEvent.info ?? '',
                            style: AppTypography.title12m.copyWith(
                              color: calendarEvent.color == null
                                  ? AppColors.primary.dark1
                                  : AppColors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Text(
                        calendarEvent.title,
                        style: AppTypography.title14m.copyWith(
                          color: calendarEvent.color == null
                              ? AppColors.gray.dark2
                              : AppColors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        calendarEvent.type,
                        style: AppTypography.title14m.copyWith(
                          color: calendarEvent.color == null
                              ? AppColors.gray.dark3
                              : AppColors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
