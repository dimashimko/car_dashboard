import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/app_typography.dart';
import 'package:car_dashboard/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../models/service_order.dart';
import '../../../../resources/theme/custom_theme_extension.dart';
import 'circular_chart_painter.dart';

class ServiceStationInfoChart extends StatelessWidget {
  const ServiceStationInfoChart({
    super.key,
    required this.list,
  });

  final double chartPadding = 20.0;
  final List<ServiceOrder> list;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 250.0,
        maxWidth: 250.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: colors(context).background,
          borderRadius: const BorderRadius.all(
            Radius.circular(14.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 20.0,
          ),
          child: Column(
            children: [
              Text(
                'Your Order',
                style: AppTypography.headingH2.copyWith(
                  color: colors(context).parametersTextColor,
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constrains) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        RotatedBox(
                          quarterTurns: 3,
                          child: SizedBox.square(
                            dimension: constrains.maxWidth,
                            child: CustomPaint(
                              painter: CircularChartPainter(
                                numberOfPoints: list.length,
                                colorMap: list.map((e) => e.color).toList(),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colors(context).serviceTimeBackground,
                          ),
                          width: (constrains.maxWidth - chartPadding) / 2,
                          height: (constrains.maxWidth - chartPadding) / 2,
                          // height: constrains.,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Service Time',
                                style: AppTypography.title14b.copyWith(
                                  color: colors(context).bookingDropdown,
                                  fontSize: 28.toResponsive(
                                    constrains.maxWidth,
                                  ),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '5, 2h',
                                style: AppTypography.title14b.copyWith(
                                  color: AppColors.primary.purple,
                                  fontSize: 32.toResponsive(
                                    constrains.maxWidth,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
