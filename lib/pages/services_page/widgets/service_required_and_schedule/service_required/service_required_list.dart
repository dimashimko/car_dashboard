import 'package:car_dashboard/generated/assets.gen.dart';
import 'package:car_dashboard/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../models/service_required.dart';
import '../../../../../resources/app_typography.dart';
import '../../../../../resources/theme/custom_theme_extension.dart';
import 'service_required_card.dart';

class ServiceRequiredList extends StatelessWidget {
  ServiceRequiredList({super.key});

  final List<ServiceRequired> list = [
    ServiceRequired(
      name: 'Center Care',
      iconPath: Assets.icons.serviceCenter.path,
      price: 48.0,
      color: AppColors.secondary.green,
      processing: 1,
    ),
    ServiceRequired(
      name: 'Diagnostics',
      iconPath: Assets.icons.serviceRepair.path,
      price: 78.0,
      color: AppColors.primary.purple,
      processing: 2,
    ),
    ServiceRequired(
      name: 'Inner Cleaning',
      iconPath: Assets.icons.serviceWashing.path,
      price: 78.0,
      color: AppColors.secondary.red,
      processing: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Service Required',
          style: AppTypography.headingH2.copyWith(
            color: colors(context).parametersTextColor,
          ),
        ),
        Gap(22.0),
        Container(
          height: 330.0,
          decoration: BoxDecoration(
            color: colors(context).background,
            borderRadius: const BorderRadius.all(
              Radius.circular(14.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: ListView.separated(
              itemCount: list.length,
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22.5),
                    child: Container(
                      height: 40.0,
                      width: 3.0,
                      decoration: BoxDecoration(
                        color: list[index].color,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                );
              },
              itemBuilder: (context, index) {
                return ServiceRequiredCard(
                  serviceRequired: list[index],
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
