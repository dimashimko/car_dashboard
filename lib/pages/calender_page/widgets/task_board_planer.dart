import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:car_dashboard/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../models/calendar_event.dart';
import 'task_board_event_card.dart';
import 'task_board_time_card.dart';

class TaskBoardPlaner extends StatefulWidget {
  const TaskBoardPlaner({super.key});

  final double timeWidth = 80;
  final double scaleFactor = 50;

  @override
  State<TaskBoardPlaner> createState() => _TaskBoardPlanerState();
}

class _TaskBoardPlanerState extends State<TaskBoardPlaner> {
  List<DateTime> hourlyList = [];
  DateTime dateTimeNow = DateTime.now();
  List<CalendarEvent> events = [
    CalendarEvent(
      startTime: DateTime(2024, 11, 15, 0, 0),
      endTime: DateTime(2024, 11, 15, 2, 0),
      color: AppColors.primary.purple,
      onColor: AppColors.gray.white,
      title: 'Drift Series Firs Round',
      type: 'JDM',
      info: '154k',
      participants: [],
    ),
    CalendarEvent(
      startTime: DateTime(2024, 11, 15, 2, 10),
      endTime: DateTime(2024, 11, 15, 4, 0),
      color: AppColors.secondary.blue,
      onColor: AppColors.gray.white,
      title: 'Drift Series Firs Round',
      type: 'JDM',
      info: '1h 45 min',
      participants: [],
    ),
    CalendarEvent(
      startTime: DateTime(2024, 11, 15, 4, 30),
      endTime: DateTime(2024, 11, 15, 5, 15),
      color: AppColors.secondary.green,
      onColor: AppColors.gray.white,
      title: 'Drift Series Firs Round',
      type: 'JDM',
      info: '154K',
      participants: [],
    ),
    CalendarEvent(
      startTime: DateTime(2024, 11, 15, 6, 0),
      endTime: DateTime(2024, 11, 15, 8, 0),
      color: AppColors.secondary.orange,
      onColor: AppColors.gray.white,
      title: 'Private Event',
      type: 'All Motorbikes',
      info: '154K',
      participants: [],
    ),
  ];

  List<DateTime> generateHourlyTimestamps(DateTime day) {
    return List.generate(24, (index) {
      return DateTime(day.year, day.month, day.day, index);
    });
  }

  @override
  void initState() {
    super.initState();
    hourlyList = generateHourlyTimestamps(
      DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors(context).background,
      // height: 820,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: hourlyList.length * widget.scaleFactor,
            ),
            ...List.generate(
              hourlyList.length,
              (index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: widget.scaleFactor * index,
                  ),
                  child: TaskBoardTimeCard(
                    time: hourlyList[index].toHourMinuteAmPm,
                    timeWidth: widget.timeWidth,
                    scaleFactor: widget.scaleFactor,
                  ),
                );
              },
            ),
            ...List.generate(
              events.length,
              (index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: events[index].startTime.toPadding(widget.scaleFactor),
                  ),
                  child: TaskBoardEventCard(
                    calendarEvent: events[index],
                    timeWidth: widget.timeWidth,
                    scaleFactor: widget.scaleFactor,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
