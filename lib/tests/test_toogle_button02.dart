import 'package:flutter/material.dart';

import '../widgets/buttons/custom_toggle_button.dart';

void main() => runApp(
      const MaterialApp(
        home: MyHomePage(),
      ),
    );

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Toggle Button with Animation',
        ),
      ),
      body: const Center(
        child: CustomToggleButton(
          options: ['Option 1', 'Option 2'],
          height: 50.0,
        ),
      ),
    );
  }
}
