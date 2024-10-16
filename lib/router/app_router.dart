import 'package:go_router/go_router.dart';

import 'app_routes.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter routerConfig = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: const DashboardRoute().location,
    routes: $appRoutes,
    observers: [],
  );
}