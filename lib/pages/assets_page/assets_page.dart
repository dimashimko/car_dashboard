import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AssetsPage extends StatelessWidget {
  const AssetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'AssetsPage',
                ),
                Gap(16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
