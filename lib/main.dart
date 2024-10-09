import 'package:car_dashboard/widgets/common/custom_expandable_draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'resources/theme/theme_provider.dart';

// ^\s*\/\/.*
// ^\s*log\(.*

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive MacOS App',
      home: const HomeScreen(),
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      builder: (context, child) {
        return Stack(
          children: [
            if (child != null) child,
            // if (kDebugMode) const CustomExpandableFab(),
            const CustomExpandableFab(),
          ],
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adaptive Layout Example'),
      ),
      body: Center(
        child: Container(
          width: size.width > 800
              ? 400
              : size.width * 0.9, // Example responsive width
          height: size.height > 600
              ? 300
              : size.height * 0.7, // Example responsive height
          color: Colors.blue,
          child: Center(
            child: Text(
              'Screen Width: ${size.width}, Screen Height: ${size.height}',
              style: const TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
