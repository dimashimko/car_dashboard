import 'package:car_dashboard/pages/services_page/widgets/service_station/service_station_info_list.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../models/service_order.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/app_typography.dart';
import '../../../../resources/theme/custom_theme_extension.dart';
import '../../../../utils/constants.dart';
import 'pay_button.dart';
import 'service_station_cards.dart';
import 'service_station_info_chart.dart';

class ServiceStation extends StatefulWidget {
  const ServiceStation({super.key});

  @override
  State<ServiceStation> createState() => _ServiceStationState();
}

class _ServiceStationState extends State<ServiceStation> {
  List<ServiceOrder> list = [
    ServiceOrder(
      name: 'Brake fluid change',
      color: AppColors.secondary.green,
      price: 32,
    ),
    ServiceOrder(
      name: 'Diagnostics',
      color: AppColors.secondary.red,
      price: 32,
    ),
    ServiceOrder(
      name: 'External Washing',
      color: AppColors.primary.purple,
      price: 32,
    ),
    ServiceOrder(
      name: 'Diagnostics',
      color: AppColors.secondary.blue,
      price: 32,
    ),
    ServiceOrder(
      name: 'External Washing',
      color: AppColors.secondary.yellow,
      price: 32,
    ),
    ServiceOrder(
      name: 'Brake fluid change',
      color: AppColors.secondary.green,
      price: 32,
    ),
    ServiceOrder(
      name: 'Diagnostics',
      color: AppColors.secondary.red,
      price: 32,
    ),
    ServiceOrder(
      name: 'External Washing',
      color: AppColors.primary.purple,
      price: 32,
    ),
    ServiceOrder(
      name: 'Diagnostics',
      color: AppColors.secondary.blue,
      price: 32,
    ),
    ServiceOrder(
      name: 'External Washing',
      color: AppColors.secondary.yellow,
      price: 32,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Service Station',
          style: AppTypography.headingH2.copyWith(
            color: colors(context).parametersTextColor,
          ),
        ),
        const Gap(16.0),
        const ServiceStationCards(),
        LayoutBuilder(
          builder: (context, constraints) {
            double availableWidth = constraints.maxWidth;

            if (availableWidth > minWidthForExpandedServiceStationInfo) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: ServiceStationInfoChart(
                      list: list,
                    ),
                  ),
                  const Gap(24.0),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: ServiceStationInfoList(
                      list: list,
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  ServiceStationInfoChart(
                    list: list,
                  ),
                  const Gap(27.0),
                  ServiceStationInfoList(
                    list: list,
                  ),
                ],
              );
            }
          },
        ),
        const Gap(20.0),
        PayButton(
          amount: 86.0,
          onTap: () {},
        ),
      ],
    );
  }
}
