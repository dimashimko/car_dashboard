import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'service_required/service_required_list.dart';
import 'service_schedule/service_schedule_list.dart';

class ServiceRequiredAndSchedule extends StatelessWidget {
  const ServiceRequiredAndSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ServiceRequiredList(),
        const Gap(30.0),
        const ServiceScheduleList(), // Placeholder(),
      ],
    );
  }
}
