import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:car_dashboard/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../models/calendar_event.dart';
import 'planer_event_participant_card.dart';

class TaskBoardEventCard extends StatelessWidget {
  const TaskBoardEventCard({
    super.key,
    required this.calendarEvent,
    required this.timeWidth,
    required this.scaleFactor,
  });

  final CalendarEvent calendarEvent;
  final double timeWidth;
  final double scaleFactor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: timeWidth + 20.0,
        right: 52.0,
      ),
      child: ClipRRect(
        child: Container(
          width: double.infinity,
          height: calendarEvent.endTime
              .difference(
                calendarEvent.startTime,
              )
              .toHeight(
                scaleFactor,
              ),
          decoration: BoxDecoration(
            color: calendarEvent.color,
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              calendarEvent.startTime.toHourMinuteAmPm,
                              style: AppTypography.title12m.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                            Text(
                              calendarEvent.info ?? '',
                              style: AppTypography.title12m.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          calendarEvent.title,
                          style: AppTypography.title14m.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              calendarEvent.type,
                              style: AppTypography.title14m.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                            const Gap(8.0),
                            Builder(
                              builder: (context) {
                                List<String> sublist = [
                                  ...calendarEvent.participants
                                ];
                                if (sublist.length > 3) {
                                  sublist = sublist.sublist(0, 3);
                                }

                                return Stack(
                                  alignment: Alignment.centerRight,
                                  children: List.generate(
                                    sublist.length,
                                    (index) {
                                      if (index == 2) {
                                        return PlanerEventParticipantCard(
                                          backgroundColor:
                                              calendarEvent.onColor,
                                          paddingColor: calendarEvent.color,
                                          child: Text(
                                            '+${calendarEvent.participants.length - 2}',
                                            style:
                                                AppTypography.title11B.copyWith(
                                              color: AppColors.white,
                                            ),
                                          ),
                                        );
                                      }
                                      return Padding(
                                        padding: EdgeInsets.only(
                                          right:
                                              ((sublist.length - 1) - index) *
                                                  20.0,
                                        ),
                                        child: PlanerEventParticipantCard(
                                          paddingColor: calendarEvent.color,
                                          child: Image.asset(
                                            fit: BoxFit.cover,
                                            sublist[index],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
