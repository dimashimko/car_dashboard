import 'package:flutter/material.dart';

import '../../resources/theme/custom_theme_extension.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1.0,
      color: color ?? colors(context).customDivider,
    );
  }
}
