import 'package:car_dashboard/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../models/service_required.dart';
import '../../../../resources/app_typography.dart';
import '../../../../resources/theme/custom_theme_extension.dart';

class ServiceRequiredCard extends StatelessWidget {
  const ServiceRequiredCard({
    super.key,
    required this.serviceRequired,
  });

  final ServiceRequired serviceRequired;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 48.0,
            width: 48.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: serviceRequired.color.withOpacity(0.5),
            ),
            child: Center(
              child: SvgPicture.asset(
                serviceRequired.iconPath,
              ),
            ),
          ),
          const Gap(16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  serviceRequired.name,
                  style: AppTypography.headingH3.copyWith(
                    color: colors(context).bookingDropdown,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const Gap(13.0),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Price : \$${serviceRequired.price.toFormattedString()}',
                      style: AppTypography.title16b.copyWith(
                        color: colors(context).parametersTextColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(16.0),
                    Container(
                      width: 1.0,
                      height: 17.0,
                      color: colors(context).dividerServiceRequired,
                    ),
                    const Gap(16.0),
                    Expanded(
                      child: Text(
                        'Processing : ${serviceRequired.processing} hours',
                        style: AppTypography.title16m.copyWith(
                          color: colors(context).procesingLabel,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
