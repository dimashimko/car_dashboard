import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'activity_statistic.dart';
import 'available_sensors.dart';
import 'notes.dart';

class AssetsParameters extends StatelessWidget {
  const AssetsParameters({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ActivityStatistic(),
        Gap(20.0),
        Notes(),
        Gap(20.0),
        AvailableSensors(),
      ],
    );
  }
}