import 'dart:io';

import 'package:car_dashboard/widgets/common/custom_expandable_draggable_fab.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';

import 'resources/theme/theme_provider.dart';
import 'router/app_router.dart';

// ^\s*\/\/.*
// ^\s*log\(.*

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
    await DesktopWindow.setMinWindowSize(
      const Size(500, 300),
    );
  }
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
    return KeyboardDismissOnTap(
      child: MaterialApp.router(
        title: 'Adaptive MacOS App',
        routerConfig: AppRouter.routerConfig,
        theme: Provider.of<ThemeProvider>(context).currentTheme,
        builder: (context, child) {
          return Stack(
            children: [
              if (child != null) child,
              const CustomExpandableFab(),
            ],
          );
        },
      ),
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
