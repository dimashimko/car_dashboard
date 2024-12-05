import 'package:flutter/material.dart';

import '../../resources/theme/custom_theme_extension.dart';

class CustomSmallDivider extends StatelessWidget {
  const CustomSmallDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.0,
      height: 17.0,
      color: colors(context).dividerServiceRequired,
    );
  }
}
