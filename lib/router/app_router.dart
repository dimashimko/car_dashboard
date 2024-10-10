import 'package:go_router/go_router.dart';

import 'app_routes.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter routerConfig = GoRouter(
    debugLogDiagnostics: true,
    // initialLocation: const SignInRoute().location,
    initialLocation: const DashboardRoute().location,
    // initialLocation: const SettingRoute().location,
    routes: $appRoutes,
    observers: [],
  );
}
