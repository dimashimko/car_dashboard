import 'package:car_dashboard/pages/dashboard_page/widgets/parameters/circular_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../models/parameter_model.dart';

class ParameterItem extends StatefulWidget {
  const ParameterItem({
    super.key,
    required this.parameter,
    this.padding = 0.0,
  });

  final ParameterModel parameter;
  final double padding;

  @override
  State<ParameterItem> createState() => _ParameterItemState();
}

class _ParameterItemState extends State<ParameterItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.padding),
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 200,
          maxWidth: 300,
        ),
        decoration: BoxDecoration(
          color: widget.parameter.backgroundColor,
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
              widget.parameter.icon,
              Text(
                widget.parameter.title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24.0,
                  color: widget.parameter.textColor,
                ),
              ),
              const Gap(8.0),
              Stack(
                alignment: Alignment.center,
                children: [
                  CircularChart(
                    percentValue: widget.parameter.percent,
                    arcColor: widget.parameter.arcColor,
                    arcBackgroundColor: widget.parameter.arcBackgroundColor,
                  ),
                  Text(
                    '${widget.parameter.percent.toInt()}%',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24.0,
                      color: widget.parameter.textColor,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
