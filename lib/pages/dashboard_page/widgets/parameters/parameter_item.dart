import 'package:car_dashboard/pages/dashboard_page/widgets/parameters/circular_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ParameterItem extends StatefulWidget {
  const ParameterItem({
    super.key,
    required this.icon,
    required this.title,
    required this.percent,
    required this.arcColor,
    required this.arcBackgroundColor,
    required this.textColor,
    required this.backgroundColor,
  });

  final Widget icon;
  final String title;
  final double percent;
  final Color arcColor;
  final Color arcBackgroundColor;
  final Color textColor;
  final Color backgroundColor;

  @override
  State<ParameterItem> createState() => _ParameterItemState();
}

class _ParameterItemState extends State<ParameterItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 200,
        maxWidth: 300,
      ),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(14.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.icon,
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24.0,
                color: widget.textColor,
              ),
            ),
            const Gap(8.0),
            Stack(
              alignment: Alignment.center,
              children: [
                CircularChart(
                  percentValue: widget.percent,
                  arcColor: widget.arcColor,
                  arcBackgroundColor: widget.arcBackgroundColor,
                ),
                Text(
                  '${widget.percent.toInt()}%',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24.0,
                    color: widget.textColor,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
