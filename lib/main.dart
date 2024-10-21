import 'dart:io';

import 'package:car_dashboard/widgets/common/custom_expandable_draggable_fab.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';

import 'navigation/navigation_provider.dart';
import 'resources/theme/theme_provider.dart';
import 'router/app_router.dart';

// ^\s*\/\/.*
// ^\s*log\(.*

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
    await DesktopWindow.setMinWindowSize(
      const Size(400, 300),
    );
  }
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: ChangeNotifierProvider(
        create: (context) => NavigationProvider(),
        child: const MyApp(),
      ),
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
        debugShowCheckedModeBanner: false,
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
