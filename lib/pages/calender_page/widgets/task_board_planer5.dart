// import 'dart:developer';

import 'dart:developer';

import 'package:car_dashboard/pages/calender_page/widgets/task_board_calculator.dart';
import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:car_dashboard/utils/constants.dart';
import 'package:car_dashboard/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../models/calendar_event.dart';
import 'task_board_event_card.dart';
import 'task_board_time_card.dart';

class TaskBoardPlaner5 extends StatefulWidget {
  const TaskBoardPlaner5({super.key});

  final double timeWidth = 80;
  final double defaultLeftPadding = 20;
  final double defaultRightPadding = 52;
  final double scaleFactor = 50;

  @override
  State<TaskBoardPlaner5> createState() => _TaskBoardPlaner5State();
}

class _TaskBoardPlaner5State extends State<TaskBoardPlaner5> {
  List<DateTime> hourlyList = [];
  DateTime dateTimeNow = DateTime.now();
  late TaskManager taskManager;

  @override
  void initState() {
    super.initState();
    taskManager = TaskManager(
      scaleFactor: widget.scaleFactor,
      // events: events,
      events: events0,
    );
    taskManager.init();
    hourlyList = generateHourlyTimestamps(
      DateTime.now(),
    );
  }

  void changeCalendarEventDelta({
    required CalendarEvent calendarEvent,
    required Offset delta,
  }) {
    // log('*** calendarEvent id: ${calendarEvent.id}');
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
      taskManager.changeCalendarEvent(
        calendarEvent: calendarEvent,
        offset: offset,
      );
    });
  }

  List<DateTime> generateHourlyTimestamps(DateTime day) {
    return List.generate(24, (index) {
      return DateTime(day.year, day.month, day.day, index);
    });
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
                double leftPadding =
                    widget.timeWidth + widget.defaultLeftPadding;

                double availableWidth = constraints.maxWidth -
                    leftPadding -
                    widget.defaultRightPadding;

                RenderBox renderBox = context.findRenderObject() as RenderBox;

                List<CalendarEvent> events = taskManager.events;
                // events.print();

                return Stack(
                  children: [
                    ...List.generate(
                      events.length,
                      (index) {
                        double widthCard =
                            availableWidth / events[index].widthLevel;

                        double cardLeftPadding = leftPadding +
                            (widthCard) * (events[index].columnNumber - 1);

                        TaskBoardEventCard card = TaskBoardEventCard(
                          calendarEvent: events[index],
                          leftPadding: cardLeftPadding,
                          width: widthCard,
                          scaleFactor: widget.scaleFactor,
                        );
                        return Padding(
                          padding: EdgeInsets.only(
                            top: events[index]
                                .startTime
                                .toPadding(widget.scaleFactor),
                            left: cardLeftPadding,
                          ),
                          child: Draggable<CalendarEvent>(
                            // key: ValueKey(events[index].id),
                            data: events[index],
                            feedback: Opacity(
                              opacity: 0.5,
                              // opacity: 0,
                              child: card,
                            ),
                            // feedback: const SizedBox(),
                            // childWhenDragging: const SizedBox(),
                            childWhenDragging: Opacity(
                              opacity: 0.5,
                              // opacity: 0,
                              child: card,
                            ),
                            child: card,
/*                            onDragUpdate: (DragUpdateDetails details) {
                              log('*** calendarEvent id: ${events[index].id}');
                              changeCalendarEventDelta(
                                calendarEvent: events[index],
                                delta: details.delta,
                              );
                            },*/
                            onDragStarted: () => log('*** onDragStarted'),
                            onDragCompleted: () => log('*** onDragCompleted'),
                            onDraggableCanceled: (details, _) =>
                                log('*** onDraggableCanceled'),
                            onDragEnd: (details) {
                              Offset localPosition =
                                  renderBox.globalToLocal(details.offset);
                              // log('*** localPosition: $localPosition');

                              changeCalendarEvent(
                                calendarEvent: events[index],
                                offset: localPosition,
                              );
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
