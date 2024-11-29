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
  final double defaultLeftPadding = 20;
  final double defaultRightPadding = 52;
  final double scaleFactor = 50;

  @override
  State<TaskBoardPlaner> createState() => _TaskBoardPlanerState();
}

class _TaskBoardPlanerState extends State<TaskBoardPlaner> {
  List<DateTime> hourlyList = [];
  DateTime dateTimeNow = DateTime.now();
  List<CalendarEvent> events = [
    CalendarEvent(
      id: 1,
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
      id: 2,
      startTime: DateTime(2024, 11, 15, 2, 10),
      endTime: DateTime(2024, 11, 15, 5, 0),
      color: AppColors.secondary.blue,
      onColor: AppColors.gray.white,
      title: 'Drift Series Firs Round',
      type: 'JDM',
      info: '1h 45 min',
      participants: [],
    ),
    CalendarEvent(
      id: 3,
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
      id: 4,
      startTime: DateTime(2024, 11, 15, 5, 0),
      endTime: DateTime(2024, 11, 15, 6, 0),
      color: AppColors.secondary.orange,
      onColor: AppColors.gray.white,
      title: 'Private Event',
      type: 'All Motorbikes',
      info: '154K',
      participants: [],
    ),
    CalendarEvent(
      id: 5,
      startTime: DateTime(2024, 11, 15, 7, 10),
      endTime: DateTime(2024, 11, 15, 11, 0),
      color: AppColors.secondary.blue,
      onColor: AppColors.gray.white,
      title: 'Drift Series Firs Round',
      type: 'JDM',
      info: '1h 45 min',
      participants: [],
    ),
    CalendarEvent(
      id: 6,
      startTime: DateTime(2024, 11, 15, 7, 30),
      endTime: DateTime(2024, 11, 15, 9, 0),
      color: AppColors.secondary.green,
      onColor: AppColors.gray.white,
      title: 'Drift Series Firs Round',
      type: 'JDM',
      info: '154K',
      participants: [],
    ),
    CalendarEvent(
      id: 7,
      startTime: DateTime(2024, 11, 15, 9, 30),
      endTime: DateTime(2024, 11, 15, 10, 30),
      color: AppColors.secondary.orange,
      onColor: AppColors.gray.white,
      title: 'Private Event',
      type: 'All Motorbikes',
      info: '154K',
      participants: [],
    ),
    CalendarEvent(
      id: 8,
      startTime: DateTime(2024, 11, 15, 16, 0),
      endTime: DateTime(2024, 11, 15, 18, 0),
      // color: AppColors.secondary.orange,
      onColor: AppColors.gray.white,
      title: 'Private Event',
      type: 'All Motorbikes',
      info: '154K',
      participants: [],
    ),
  ];

  void changeCalendarEvent({
    required CalendarEvent calendarEvent,
    required Offset offset,
  }) {
    if (offset.dy <= 0 || offset.dy >= widget.scaleFactor * 24) {
      return;
    }

    setState(() {
      events = events.map((event) {
        if (event.id == calendarEvent.id) {
          final DateTime newStartTime = _calculateNewStartTime(offset.dy);
          final Duration duration = event.endTime.difference(event.startTime);
          final DateTime newEndTime = newStartTime.add(duration);

          return event.copyWith(
            startTime: newStartTime,
            endTime: newEndTime,
          );
        }
        return event;
      }).toList();
      events.sorted;
    });
  }

  DateTime _calculateNewStartTime(double offsetY) {
    final double time = offsetY / widget.scaleFactor;
    final int hour = time.toInt();
    final int minute = ((time - hour) * 60).toInt();

    return DateTime(2024, 11, 15, hour, minute);
  }

  List<DateTime> generateHourlyTimestamps(DateTime day) {
    return List.generate(24, (index) {
      return DateTime(day.year, day.month, day.day, index);
    });
  }

  int countOverlappingEvents(CalendarEvent calendarEvent) {
    return events
            .where((event) =>
                event != calendarEvent &&
                event.startTime.isBefore(calendarEvent.endTime) &&
                calendarEvent.startTime.isBefore(event.endTime))
            .length +
        1;
  }

  int countPreviousOverlappingEvents(CalendarEvent calendarEvent) {
    return events
        .takeWhile((event) => event != calendarEvent)
        .where((event) =>
            event.startTime.isBefore(calendarEvent.endTime) &&
            calendarEvent.startTime.isBefore(event.endTime))
        .length;
  }

  double countLeftPadding({
    required double maxWidth,
    required CalendarEvent event,
  }) {
    double leftPadding = widget.timeWidth + widget.defaultLeftPadding;

    double availableWidth = maxWidth - leftPadding - widget.defaultRightPadding;

    int quantityInRow = countOverlappingEvents(event);

    int quantityPreviousOverlap = countPreviousOverlappingEvents(event);

    double width = availableWidth / quantityInRow;

    leftPadding = leftPadding + (quantityPreviousOverlap * width);
    return leftPadding;
  }

  double countWidth({
    required double maxWidth,
    required CalendarEvent event,
  }) {
    double leftPadding = widget.timeWidth + widget.defaultLeftPadding;

    double availableWidth = maxWidth - leftPadding - widget.defaultRightPadding;

    int quantityInRow = countOverlappingEvents(event);

    double width = availableWidth / quantityInRow;

    return width;
  }

  @override
  void initState() {
    super.initState();
    events = events.sorted;
    hourlyList = generateHourlyTimestamps(
      DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors(context).background,
      height: 820,
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
            LayoutBuilder(
              builder: (context, constraints) {
                return DragTarget<CalendarEvent>(
                  builder: (context, candidateData, rejectedData) {
                    return Container(
                      color: Colors.transparent,
                      // color: Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF)),
                      width: double.infinity,
                      height: hourlyList.length * widget.scaleFactor,
                    );
                  },
                  onWillAcceptWithDetails: (data) => true,
                  onAcceptWithDetails: (details) {
                    RenderBox renderBox =
                        context.findRenderObject() as RenderBox;
                    Offset localPosition =
                        renderBox.globalToLocal(details.offset);
                    changeCalendarEvent(
                      calendarEvent: details.data,
                      offset: localPosition,
                    );
                  },
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
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      TaskBoardEventCard card = TaskBoardEventCard(
                        calendarEvent: events[index],
                        // leftPadding: leftPadding,
                        leftPadding: countLeftPadding(
                          maxWidth: constraints.maxWidth,
                          event: events[index],
                        ),
                        // width: width,
                        width: countWidth(
                          maxWidth: constraints.maxWidth,
                          event: events[index],
                        ),
                        scaleFactor: widget.scaleFactor,
                      );

                      return Draggable<CalendarEvent>(
                        data: events[index],
                        feedback: Opacity(
                          opacity: 0.5,
                          child: card,
                        ),
                        childWhenDragging: const SizedBox(),
                        child: card,
                      );
                    },
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
