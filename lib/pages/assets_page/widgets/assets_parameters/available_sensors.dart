import 'package:car_dashboard/generated/assets.gen.dart';
import 'package:car_dashboard/models/sensor.dart';
import 'package:car_dashboard/pages/assets_page/widgets/assets_parameters/sensor_card.dart';
import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../resources/theme/custom_theme_extension.dart';

class AvailableSensors extends StatefulWidget {
  const AvailableSensors({
    super.key,
  });

  @override
  State<AvailableSensors> createState() => _AvailableSensorsState();
}

class _AvailableSensorsState extends State<AvailableSensors> {
  List<Sensor> sensors = [
    Sensor(
      name: 'Asset - Fuel Consumed',
      unit: '(10',
      isSelected: true,
    ),
    Sensor(
      name: 'Asset - Odometer',
      unit: '(km)',
      isSelected: false,
    ),
    Sensor(
      name: 'Asset - Runtime',
      unit: '(km)',
      isSelected: false,
    ),
    Sensor(
      name: 'Asset - Speed',
      unit: '(hr)',
      isSelected: false,
    ),
    Sensor(
      name: 'Engine Temperature',
      unit: '(deg C)',
      isSelected: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors(context).background,
        borderRadius: const BorderRadius.all(
          Radius.circular(14.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Available Sensors ',
                  style: AppTypography.headingH3.copyWith(
                    color: colors(context).parametersTextColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Text(
                  'Assets',
                  style: AppTypography.title12m.copyWith(
                    color: colors(context).textGray,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const Gap(8.0),
                Assets.icons.dropDown.svg(),
              ],
            ),
            const Gap(20.0),
            Divider(
              color: colors(context).dividerSensor,
            ),
            const Gap(20.0),
            ListView.separated(
              itemCount: sensors.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, __) => const SizedBox(
                height: 16.0,
              ),
              itemBuilder: (context, index) => SensorCard(
                name: sensors[index].name,
                unit: sensors[index].unit,
                value: sensors[index].isSelected,
                onChanged: (bool newValue) {
                  setState(() {
                    sensors[index].isSelected = newValue;
                  });
                },
              ),
            ),
            const Gap(20.0),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.secondary.red,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 2.5,
                  ),
                  child: Text(
                    'See All',
                    style: AppTypography.title14m.copyWith(
                      color: AppColors.gray.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
