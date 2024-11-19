import 'package:car_dashboard/pages/calender_page/widgets/calendar_first_part.dart';
import 'package:car_dashboard/pages/calender_page/widgets/calendar_second_part.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/constants.dart';

class CalenderPage extends StatelessWidget {
  const CalenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    double availableWidth = constraints.maxWidth;

                    if (availableWidth > minWidthForExpandedCalendar) {
                      return const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (true)
                            // if (false)
                            Flexible(
                              fit: FlexFit.tight,
                              flex: 3,
                              child: CalendarFirstPart(),
                            ),
                          Gap(24.0),
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 5,
                            child: CalendarSecondPart(),
                          ),
                        ],
                      );
                    } else {
                      return const Column(
                        children: [
                          // if (false)
                          if (true) CalendarFirstPart(),
                          CalendarSecondPart(),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
