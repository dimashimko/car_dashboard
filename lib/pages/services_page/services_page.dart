import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/constants.dart';
import 'widgets/service_required_and_schedule.dart';
import 'widgets/service_station/service_station.dart';

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
                LayoutBuilder(
                  builder: (context, constraints) {
                    double availableWidth = constraints.maxWidth;

                    if (availableWidth > minWidthForExpandedService) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Flexible(
                            fit: FlexFit.tight,
                            flex: 2,
                            child: ServiceStation(),
                          ),
                          const Gap(24.0),
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: ServiceRequiredAndSchedule(),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          const ServiceStation(),
                          const Gap(27.0),
                          ServiceRequiredAndSchedule(),
                        ],
                      );
                    }
                  },
                ),
                const Gap(30.0),
                const Placeholder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
