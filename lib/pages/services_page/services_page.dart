import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/constants.dart';
import 'widgets/service_required_and_schedule/service_required_and_schedule.dart';
import 'widgets/service_station/service_station.dart';
import 'widgets/service_status_bar/service_status_bar.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(16.0),
                if (true)
                  // if (false)
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double availableWidth = constraints.maxWidth;

                      if (availableWidth > minWidthForExpandedService) {
                        return const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              flex: 5,
                              child: ServiceStation(),
                            ),
                            Gap(24.0),
                            Flexible(
                              fit: FlexFit.tight,
                              flex: 4,
                              child: ServiceRequiredAndSchedule(),
                            ),
                          ],
                        );
                      } else {
                        return const Column(
                          children: [
                            ServiceStation(),
                            Gap(27.0),
                            ServiceRequiredAndSchedule(),
                          ],
                        );
                      }
                    },
                  ),
                const Gap(30.0),
                const ServiceStatusBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
