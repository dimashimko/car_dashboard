import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../resources/theme/custom_theme_extension.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

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
                  'BookingPage',
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
