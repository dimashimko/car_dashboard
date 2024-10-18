import 'package:flutter/material.dart';

class ParameterModel {
  ParameterModel({
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
}
