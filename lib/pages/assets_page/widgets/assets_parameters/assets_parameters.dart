import 'package:car_dashboard/pages/assets_page/widgets/assets_parameters/reminder_table.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'activity_statistic.dart';
import 'available_sensors.dart';
import 'notes.dart';

class AssetsParameters extends StatelessWidget {
  const AssetsParameters({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const ActivityStatistic(),
        const Gap(20.0),
        GridView.builder(
          shrinkWrap: true,
          // primary: true,
          // primary: false,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 550.0,
            mainAxisExtent: 314.0,
            crossAxisSpacing: 25.0,
            mainAxisSpacing: 20.0,
          ),
          itemBuilder: (context, index) {
            if (index == 0) {
              return const Notes();
            }
            return const AvailableSensors();
          },
        ),
        const Gap(20.0),
        const ReminderTable(),
      ],
    );
  }
}
