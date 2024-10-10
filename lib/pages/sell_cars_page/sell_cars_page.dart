import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../resources/theme/custom_theme_extension.dart';

class SellCarsPage extends StatelessWidget {
  const SellCarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'SellCarsPage',
                  style: TextStyle(
                    color: colors(context).textPrimary,
                  ),
                ),
                const Gap(16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
