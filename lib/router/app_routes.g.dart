// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $signInRoute,
      $homeRoute,
    ];

RouteBase get $signInRoute => GoRouteData.$route(
      path: '/sign-in',
      factory: $SignInRouteExtension._fromState,
    );

extension $SignInRouteExtension on SignInRoute {
  static SignInRoute _fromState(GoRouterState state) => const SignInRoute();

  String get location => GoRouteData.$location(
        '/sign-in',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeRoute => ShellRouteData.$route(
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/dashboard',
          factory: $DashboardRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/assets',
          factory: $AssetsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/booking',
          factory: $BookingRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/sell-cars',
          factory: $SellCarsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/buy-cars',
          factory: $BuyCarsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/services',
          factory: $ServicesRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/calender',
          factory: $CalenderRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/messages',
          factory: $MessagesRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'chat',
              factory: $ChatRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: '/setting',
          factory: $SettingRouteExtension._fromState,
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();
}

extension $DashboardRouteExtension on DashboardRoute {
  static DashboardRoute _fromState(GoRouterState state) =>
      const DashboardRoute();

  String get location => GoRouteData.$location(
        '/dashboard',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AssetsRouteExtension on AssetsRoute {
  static AssetsRoute _fromState(GoRouterState state) => const AssetsRoute();

  String get location => GoRouteData.$location(
        '/assets',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BookingRouteExtension on BookingRoute {
  static BookingRoute _fromState(GoRouterState state) => const BookingRoute();

  String get location => GoRouteData.$location(
        '/booking',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SellCarsRouteExtension on SellCarsRoute {
  static SellCarsRoute _fromState(GoRouterState state) => const SellCarsRoute();

  String get location => GoRouteData.$location(
        '/sell-cars',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BuyCarsRouteExtension on BuyCarsRoute {
  static BuyCarsRoute _fromState(GoRouterState state) => const BuyCarsRoute();

  String get location => GoRouteData.$location(
        '/buy-cars',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ServicesRouteExtension on ServicesRoute {
  static ServicesRoute _fromState(GoRouterState state) => const ServicesRoute();

  String get location => GoRouteData.$location(
        '/services',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CalenderRouteExtension on CalenderRoute {
  static CalenderRoute _fromState(GoRouterState state) => const CalenderRoute();

  String get location => GoRouteData.$location(
        '/calender',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MessagesRouteExtension on MessagesRoute {
  static MessagesRoute _fromState(GoRouterState state) => const MessagesRoute();

  String get location => GoRouteData.$location(
        '/messages',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ChatRouteExtension on ChatRoute {
  static ChatRoute _fromState(GoRouterState state) => const ChatRoute();

  String get location => GoRouteData.$location(
        '/messages/chat',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingRouteExtension on SettingRoute {
  static SettingRoute _fromState(GoRouterState state) => const SettingRoute();

  String get location => GoRouteData.$location(
        '/setting',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
