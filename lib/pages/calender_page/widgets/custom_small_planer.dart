import 'package:car_dashboard/generated/assets.gen.dart';
import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../models/calendar_event.dart';
import 'planer_event_card.dart';
import 'planer_time_card.dart';
import 'planer_time_now_line.dart';

class CustomSmallPlaner extends StatefulWidget {
  const CustomSmallPlaner({super.key});

  final double timeWidth = 46;
  final double scaleFactor = 50;

  @override
  State<CustomSmallPlaner> createState() => _CustomSmallPlanerState();
}

class _CustomSmallPlanerState extends State<CustomSmallPlaner> {
  List<DateTime> hourlyList = [];
  DateTime dateTimeNow = DateTime.now();
  List<CalendarEvent> events = [
    CalendarEvent(
      id: 1,
      startTime: DateTime(2024, 11, 15, 0, 0),
      endTime: DateTime(2024, 11, 15, 2, 0),
      color: AppColors.primary.purple,
      onColor: AppColors.primary.onPurple,
      title: 'Drift Series Firs Round',
      type: 'JDM',
      participants: [
        Assets.images.avatar.path,
        Assets.images.photo02.path,
        Assets.images.photo03.path,
        Assets.images.photo04.path,
        Assets.images.carAudiQ5.path,
        Assets.images.porscheCarella1.path,
        Assets.images.porscheCarella2.path,
      ],
    ),
    CalendarEvent(
      id: 2,
      startTime: DateTime(2024, 11, 15, 2, 10),
      endTime: DateTime(2024, 11, 15, 4, 0),
      color: AppColors.secondary.blue,
      onColor: AppColors.secondary.onBlue,
      title: 'Drift Series Firs Round',
      type: 'JDM',
      participants: [
        Assets.images.avatar.path,
        Assets.images.carSuzukiErtiga.path,
        Assets.images.carMarutiSuzukiDzire.path,
        Assets.images.carToyotaInnova.path,
        Assets.images.carAudiQ5.path,
      ],
    ),
    CalendarEvent(
      id: 3,
      startTime: DateTime(2024, 11, 15, 4, 30),
      endTime: DateTime(2024, 11, 15, 5, 15),
      color: AppColors.secondary.green,
      onColor: AppColors.secondary.onGreen,
      title: 'Drift Series Firs Round',
      type: 'JDM',
      participants: [
        Assets.images.carToyotaInnova.path,
      ],
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
    return SizedBox(
      height: 300,
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
                if (dateTimeNow.difference(hourlyList[index]).inMinutes.modulo <
                    15) {
                  return const SizedBox();
                }
                return Padding(
                  padding: EdgeInsets.only(
                    top: widget.scaleFactor * index,
                  ),
                  child: PlanerTimeCard(
                    time: hourlyList[index].toHourMinute,
                    timeWidth: widget.timeWidth,
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(
                top: dateTimeNow.toPadding(widget.scaleFactor),
              ),
              child: PlanerTimeNowLine(
                time: dateTimeNow.toHourMinute,
                timeWidth: widget.timeWidth,
              ),
            ),
            ...List.generate(
              events.length,
              (index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: events[index].startTime.toPadding(widget.scaleFactor),
                  ),
                  child: PlanerEventCard(
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
