import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:car_dashboard/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../models/calendar_event.dart';
import 'task_board_event_card.dart';
import 'task_board_time_card.dart';

class TaskBoardPlaner3 extends StatefulWidget {
  const TaskBoardPlaner3({super.key});

  final double timeWidth = 80;
  final double defaultLeftPadding = 20;
  final double defaultRightPadding = 52;
  final double scaleFactor = 50;

  @override
  State<TaskBoardPlaner3> createState() => _TaskBoardPlaner3State();
}

class _TaskBoardPlaner3State extends State<TaskBoardPlaner3> {
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
      startTime: DateTime(2024, 11, 15, 3, 30),
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
      // startTime: DateTime(2024, 11, 15, 4, 0),
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
      events = [
        ...calculatePositionParameters(),
      ];
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

  // ********************************************************************

  List<CalendarEvent> newList = [];

  List<CalendarEvent> calculatePositionParameters() {
    final Map<int, int> idToIndex = {};
    newList = [];

    // Step 1: Initialize events and assign column numbers.
    for (int i = 0; i < events.length; i++) {
      CalendarEvent event = events[i];
      event = event.copyWith(
        widthLevel: 1,
        columnNumber: 1,
        relatedId: [],
      );

      int columnNumber = 1;
      while (true) {
        bool hasIntersect = newList.any(
            (e) => e.columnNumber == columnNumber && checkIntersect(e, event));
        if (!hasIntersect) {
          newList.add(event.copyWith(columnNumber: columnNumber));
          idToIndex[event.id] = newList.length - 1;
          break;
        } else {
          columnNumber++;
        }
      }
    }

    // Step 2: Determine related events.
    for (int i = 0; i < newList.length; i++) {
      CalendarEvent event = newList[i];
      List<int> intersectIds = getIdOfIntersectEvents(
        events: newList
            .where((e) => e.columnNumber == event.columnNumber - 1)
            .toList(),
        calendarEvent: event,
      );

      newList[i] = event.copyWith(relatedId: intersectIds);
    }

    // Step 3: Update width levels.
    for (int i = 0; i < newList.length; i++) {
      CalendarEvent event = newList[i];
      if (event.widthLevel < event.columnNumber) {
        newList[i] = event.copyWith(widthLevel: event.columnNumber);
      }
      setWidthLevelToRelated(newList[i], idToIndex);
    }

    return newList;
  }

  void setWidthLevelToRelated(CalendarEvent event, Map<int, int> idToIndex) {
    for (int id in event.relatedId) {
      int? index = idToIndex[id];
      if (index != null) {
        CalendarEvent relatedEvent = newList[index];
        if (relatedEvent.widthLevel < event.widthLevel) {
          newList[index] = relatedEvent.copyWith(widthLevel: event.widthLevel);
          setWidthLevelToRelated(newList[index], idToIndex);
        }
      }
    }
  }

  List<int> getIdOfIntersectEvents({
    required List<CalendarEvent> events,
    required CalendarEvent calendarEvent,
  }) {
    return events
        .where((event) =>
            event.id != calendarEvent.id &&
            checkIntersect(event, calendarEvent))
        .map((e) => e.id)
        .toList();
  }

  bool checkIntersect(CalendarEvent baseEvent, CalendarEvent newEvent) {
    return baseEvent.startTime.isBefore(newEvent.endTime) &&
        baseEvent.endTime.isAfter(newEvent.startTime);
  }

  @override
  void initState() {
    super.initState();
    events = events.sorted;
    hourlyList = generateHourlyTimestamps(
      DateTime.now(),
    );
    events = [
      ...calculatePositionParameters(),
    ];
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
                      double leftPadding =
                          widget.timeWidth + widget.defaultLeftPadding;

                      double availableWidth = constraints.maxWidth -
                          leftPadding -
                          widget.defaultRightPadding;

                      double widthCard =
                          availableWidth / events[index].widthLevel;

                      leftPadding = leftPadding +
                          (widthCard) * (events[index].columnNumber - 1);

                      TaskBoardEventCard card = TaskBoardEventCard(
                        calendarEvent: events[index],
                        leftPadding: leftPadding,
                        width: widthCard,
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
