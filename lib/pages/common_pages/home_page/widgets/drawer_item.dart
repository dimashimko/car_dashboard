import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.iconPath,
    required this.title,
    required this.isExpanded,
  });

  final bool isSelected;
  final VoidCallback onTap;
  final String iconPath;
  final String title;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? colors(context).onBackground : Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                iconPath,
                colorFilter: ColorFilter.mode(
                  isSelected
                      ? colors(context).textSecondarySelected
                      : colors(context).textSecondary,
                  BlendMode.srcIn,
                ),
              ),
              if (isExpanded) ...[
                const Gap(8.0),
                Text(
                  title,
                  style: TextStyle(
                    color: colors(context).textSecondary,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
