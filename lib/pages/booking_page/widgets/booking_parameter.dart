import 'package:car_dashboard/resources/app_colors.dart';
import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookingParameter extends StatefulWidget {
  const BookingParameter({
    super.key,
    required this.iconPath,
  });

  final String iconPath;

  @override
  State<BookingParameter> createState() => _BookingParameterState();
}

class _BookingParameterState extends State<BookingParameter> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        height: 44.0,
        width: 44.0,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.purple
              : colors(context).background,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            widget.iconPath,
            colorFilter: ColorFilter.mode(
              isSelected
                  ? AppColors.gray.white
                  : colors(context).bookingIconColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
