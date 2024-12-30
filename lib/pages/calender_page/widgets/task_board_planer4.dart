// import 'dart:developer';

import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:car_dashboard/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../models/calendar_event.dart';
import 'task_board_event_card.dart';

class TaskBoardPlaner4 extends StatefulWidget {
  const TaskBoardPlaner4({super.key});

  final double timeWidth = 80;
  final double defaultLeftPadding = 20;
  final double defaultRightPadding = 52;
  final double scaleFactor = 50;

  @override
  State<TaskBoardPlaner4> createState() => _TaskBoardPlaner4State();
}

class _TaskBoardPlaner4State extends State<TaskBoardPlaner4> {
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

  // Add a new property to track the currently dragged event
  CalendarEvent? currentlyDraggedEvent;

  void changeCalendarEventDelta({
    required CalendarEvent calendarEvent,
    required Offset delta,
  }) {
    // Skip if this isn't the currently dragged event
    if (currentlyDraggedEvent?.id != calendarEvent.id) return;

    Offset original = Offset(
      0,
      calendarEvent.startTime.toPadding(widget.scaleFactor),
    );
    changeCalendarEvent(
      calendarEvent: calendarEvent,
      offset: original + delta,
    );
  }

  void changeCalendarEvent({
    required CalendarEvent calendarEvent,
    required Offset offset,
  }) {
    if (offset.dy <= 0 || offset.dy >= widget.scaleFactor * 24) {
      return;
    }

    setState(() {
      events = events
          .map((event) {
            if (event.id == calendarEvent.id) {
              final DateTime newStartTime = _calculateNewStartTime(offset.dy);
              final Duration duration =
                  event.endTime.difference(event.startTime);
              final DateTime newEndTime = newStartTime.add(duration);

              return event.copyWith(
                startTime: newStartTime,
                endTime: newEndTime,
              );
            }
            return event;
          })
          .toList()
          .sorted;
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

  List<CalendarEvent> newList = [];

  List<CalendarEvent> calculatePositionParameters() {
    newList = [];

    for (int i = 0; i < events.length; i++) {
      CalendarEvent newCalendarEvent = events[i].copyWith(
        widthLevel: 1,
        columnNumber: 1,
        relatedId: [],
      );

      int columnNumber = 1;
      while (true) {
        List<int> intersectId = getIdOfIntersectEvents(
          events: newList.where((e) => e.columnNumber == columnNumber).toList(),
          calendarEvent: newCalendarEvent,
        );
        if (intersectId.isEmpty) {
          newList.add(
            newCalendarEvent.copyWith(
              columnNumber: columnNumber,
            ),
          );
          break;
        } else {
          columnNumber++;
        }
      }
    }

    for (int i = 0; i < newList.length; i++) {
      CalendarEvent calendarEvent = newList[i];
      List<int> intersectId = getIdOfIntersectEvents(
        events: newList
            .where(
              (e) => e.columnNumber == (calendarEvent.columnNumber - 1),
            )
            .toList(),
        calendarEvent: calendarEvent,
      );
      newList[i] = calendarEvent.copyWith(
        relatedId: intersectId,
      );
    }

    for (int i = 0; i < newList.length; i++) {
      if (newList[i].widthLevel < newList[i].columnNumber) {
        newList[i] = newList[i].copyWith(
          widthLevel: newList[i].columnNumber,
        );
      }
    }

    for (CalendarEvent event in newList) {
      setWidthLevelToRelated(event);
    }

/*
      for (CalendarEvent event in newList) {
        log('*** event.id: ${event.id}');
        log('*** event.startTime: ${event.startTime}');
        log('*** event.columnNumber: ${event.columnNumber}');
        log('*** event.widthLevel: ${event.widthLevel}');
        log('*** event.relatedId: ${event.relatedId}');
        log('');
      }
*/

    return newList;
  }

  List<int> getIdOfIntersectEvents({
    required List<CalendarEvent> events,
    required CalendarEvent calendarEvent,
  }) {
    return events
        .where(
          (event) =>
              event != calendarEvent &&
              checkIntersect(
                event,
                calendarEvent,
              ),
        )
        .map((e) => e.id)
        .toList();
  }

  bool checkIntersect(CalendarEvent baseEvent, CalendarEvent newEvent) {
    return baseEvent.startTime.isBefore(newEvent.endTime) &&
        baseEvent.endTime.isAfter(newEvent.startTime);
  }

  void setWidthLevelToRelated(CalendarEvent event) {
    for (int id in event.relatedId) {
      var indexOfRelated = getIndexById(newList, id);
      if (indexOfRelated != null) {
        if (newList[indexOfRelated].widthLevel < event.widthLevel) {
          newList[indexOfRelated] = newList[indexOfRelated].copyWith(
            widthLevel: event.widthLevel,
          );
        }
        setWidthLevelToRelated(
          newList[indexOfRelated],
        );
      }
    }
  }

  int? getIndexById(List<CalendarEvent> list, int id) {
    final index = list.indexWhere((event) => event.id == id);
    return index != -1 ? index : null;
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
            // ... keep existing time-related widgets ...

            LayoutBuilder(
              builder: (context, constraints) {
                double leftPadding =
                    widget.timeWidth + widget.defaultLeftPadding;
                double availableWidth = constraints.maxWidth -
                    leftPadding -
                    widget.defaultRightPadding;
                RenderBox renderBox = context.findRenderObject() as RenderBox;

                return Stack(
                  children: [
                    ...List.generate(
                      events.length,
                      (index) {
                        final event = events[index];
                        double widthCard = availableWidth / event.widthLevel;
                        double cardLeftPadding = leftPadding +
                            (widthCard) * (event.columnNumber - 1);

                        TaskBoardEventCard card = TaskBoardEventCard(
                          calendarEvent: event,
                          leftPadding: cardLeftPadding,
                          width: widthCard,
                          scaleFactor: widget.scaleFactor,
                        );

                        return Padding(
                          padding: EdgeInsets.only(
                            top: event.startTime.toPadding(widget.scaleFactor),
                            left: cardLeftPadding,
                          ),
                          child: Draggable<CalendarEvent>(
                            data: event,
                            feedback: Opacity(
                              opacity: 0.5,
                              child: card,
                            ),
                            childWhenDragging: const SizedBox(),
                            child: card,
                            onDragStarted: () {
                              setState(() {
                                currentlyDraggedEvent = event;
                              });
                            },
                            onDragUpdate: (DragUpdateDetails details) {
                              changeCalendarEventDelta(
                                calendarEvent: event,
                                delta: details.delta,
                              );
                            },
                            onDragEnd: (details) {
                              Offset localPosition =
                                  renderBox.globalToLocal(details.offset);
                              changeCalendarEvent(
                                calendarEvent: event,
                                offset: localPosition,
                              );
                              setState(() {
                                currentlyDraggedEvent = null;
                              });
                            },
                            onDraggableCanceled: (_, __) {
                              setState(() {
                                currentlyDraggedEvent = null;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
