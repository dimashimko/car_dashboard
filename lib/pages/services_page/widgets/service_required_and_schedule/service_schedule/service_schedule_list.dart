import 'package:flutter/material.dart';

import '../../../../../models/service_schedule.dart';
import '../../../../../resources/app_typography.dart';
import '../../../../../resources/theme/custom_theme_extension.dart';
import 'service_schedule_card.dart';

class ServiceScheduleList extends StatefulWidget {
  const ServiceScheduleList({super.key});

  @override
  State<ServiceScheduleList> createState() => _ServiceScheduleListState();
}

class _ServiceScheduleListState extends State<ServiceScheduleList> {
  int currentIndex = 0;
  final List<ServiceSchedule> list = [
    const ServiceSchedule(
      text: 'Upgrade your favorite car periodically',
      when: 'Today, 10.00',
      fixPrice: 1200,
    ),
    const ServiceSchedule(
      text: 'Buy spare parts for suspension',
      when: 'Today, 14.00',
      fixPrice: 1400,
    ),
    const ServiceSchedule(
      text: 'Upgrade your favorite car periodically',
      when: 'Today, 10.00',
      fixPrice: 1200,
    ),
    const ServiceSchedule(
      text: 'Buy spare parts for suspension',
      when: 'Today, 14.00',
      fixPrice: 1400,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Service Schedule',
          style: AppTypography.headingH2.copyWith(
            color: colors(context).parametersTextColor,
          ),
        ),
        SizedBox(
          height: 227.0,
          child: ListView.builder(
            itemCount: list.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ServiceScheduleCard(
                serviceSchedule: list[index],
                isSelected: currentIndex == index,
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
