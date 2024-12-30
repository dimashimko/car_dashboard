import 'package:car_dashboard/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../models/calendar_event.dart';

class TaskManager {
  TaskManager({
    required this.events,
    required this.scaleFactor,
  });

  List<CalendarEvent> events;
  double scaleFactor;
  List<CalendarEvent> newList = [];

  // List<CalendarEvent> get getEvents => events;

  void init() {
    events = events.sorted;
    events = [
      ...calculatePositionParameters(),
    ];
  }

  void changeCalendarEvent({
    required CalendarEvent calendarEvent,
    required Offset offset,
  }) {
    events = events
        .map((event) {
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
        })
        .toList()
        .sorted;
    events = [
      ...calculatePositionParameters(),
    ];
  }

  DateTime _calculateNewStartTime(double offsetY) {
    final double time = offsetY / scaleFactor;
    final int hour = time.toInt();
    final int minute = ((time - hour) * 60).toInt();

    return DateTime(2024, 11, 15, hour, minute);
  }

  List<CalendarEvent> calculatePositionParameters() {
    newList = [];
    // events = events.sorted;

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
          // events: newList.toList(),
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

    newList.print();

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
      int? indexOfRelated = getIndexById(newList, id);
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
}
