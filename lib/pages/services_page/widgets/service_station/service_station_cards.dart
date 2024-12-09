import 'package:car_dashboard/models/station.dart';
import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:car_dashboard/widgets/common/row_scrollable.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../utils/constants.dart';
import 'service_station_card.dart';

class ServiceStationCards extends StatefulWidget {
  const ServiceStationCards({super.key});

  @override
  State<ServiceStationCards> createState() => _ServiceStationCardsState();
}

class _ServiceStationCardsState extends State<ServiceStationCards> {
  List<Station> stations = listStations;

  int currentStationIndex = 0;

  void onTapStation(int index) {
    setState(() {
      currentStationIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      double maxWidth = constraint.maxWidth;
      return Column(
        children: [
          GridView.builder(
            itemCount: stations.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 10,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) => ServiceStationCard(
              station: stations[index],
              maxWidthWidget: maxWidth,
              isCurrent: index == currentStationIndex,
              onTap: () => onTapStation(index),
            ),
          ),
          const Gap(27.0),
          RowScrollable(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 12.0,
                height: 12.0,
                decoration: BoxDecoration(
                  color: colors(context).background,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colors(context).dark,
                    width: 1,
                  ),
                ),
              ),
              const Gap(8.0),
              Text(
                'Ready',
                style: AppTypography.title16m.copyWith(
                  color: colors(context).bookingPassengerText,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(30.0),
              Container(
                width: 12.0,
                height: 12.0,
                decoration: BoxDecoration(
                  color: AppColors.secondary.red,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.secondary.red,
                    width: 2,
                  ),
                ),
              ),
              const Gap(8.0),
              Text(
                'Booked',
                style: AppTypography.title16m.copyWith(
                  color: colors(context).bookingPassengerText,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(30.0),
              Container(
                width: 12.0,
                height: 12.0,
                decoration: BoxDecoration(
                  color: AppColors.primary.purple,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primary.purple,
                    width: 2,
                  ),
                ),
              ),
              const Gap(8.0),
              Text(
                'Current Station',
                style: AppTypography.title16m.copyWith(
                  color: colors(context).bookingPassengerText,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const Gap(27.0),
        ],
      );
    });
  }
}
