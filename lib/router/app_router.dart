import 'package:go_router/go_router.dart';

import 'app_routes.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter routerConfig = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: const MessagesRoute().location,
    // initialLocation: const ServicesRoute().location,
    // initialLocation: const CalenderRoute().location,
    routes: $appRoutes,
    observers: [],
  );
}
