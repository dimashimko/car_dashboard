import 'package:flutter/material.dart';

extension SizeExtension on num {
  double toResponsive(BoxConstraints constraints) {
    return this * constraints.maxWidth * 0.0024;
  }
}
