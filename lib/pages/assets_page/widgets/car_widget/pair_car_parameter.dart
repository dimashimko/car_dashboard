import 'package:car_dashboard/resources/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';

import 'car_parameter.dart';

class PairCarParameter extends StatelessWidget {
  const PairCarParameter({
    super.key,
    required this.firstTitle,
    required this.secondTitle,
    required this.firstValue,
    required this.secondValue,
  });

  final String firstTitle;
  final String firstValue;
  final String secondTitle;
  final String secondValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CarParameter(
            title: firstTitle,
            value: firstValue,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            height: 41.0,
            width: 2.0,
            color: colors(context).divider,
          ),
        ),
        Expanded(
          child: CarParameter(
            title: secondTitle,
            value: secondValue,
          ),
        ),
      ],
    );
  }
}
