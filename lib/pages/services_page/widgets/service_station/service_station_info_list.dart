import 'package:car_dashboard/models/service_order.dart';
import 'package:car_dashboard/pages/services_page/widgets/service_station/add_service_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'info_list_card.dart';

class ServiceStationInfoList extends StatefulWidget {
  const ServiceStationInfoList({
    super.key,
    required this.list,
  });

  final List<ServiceOrder> list;

  @override
  State<ServiceStationInfoList> createState() => _ServiceStationInfoListState();
}

class _ServiceStationInfoListState extends State<ServiceStationInfoList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200.0,
          child: ListView.separated(
            itemCount: widget.list.length,
            shrinkWrap: true,
            separatorBuilder: (_, __) => const Gap(10.0),
            itemBuilder: (context, index) {
              return InfoListCard(
                serviceOrder: widget.list[index],
              );
            },
          ),
        ),
        const Gap(12.0),
        AddServiceButton(
          onTap: () {},
        ),
      ],
    );
  }
}
