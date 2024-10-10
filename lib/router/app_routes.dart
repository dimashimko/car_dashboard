import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/assets_page/assets_page.dart';
import '../pages/booking_page/booking_page.dart';
import '../pages/buy_cars_page/buy_cars_page.dart';
import '../pages/calender_page/calender_page.dart';
import '../pages/common_pages/home_page/home_page.dart';
import '../pages/dashboard_page/dashboard_page.dart';
import '../pages/messages_page/messages_page.dart';
import '../pages/sell_cars_page/sell_cars_page.dart';
import '../pages/services_page/services_page.dart';
import '../pages/setting_page/setting_page.dart';
import '../pages/sign_in_page/sign_in_page.dart';

part 'app_routes.g.dart';

@TypedGoRoute<SignInRoute>(
  path: '/sign-in',
)
class SignInRoute extends GoRouteData {
  const SignInRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) =>
      const SignInPage();
}

@TypedShellRoute<HomeRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<DashboardRoute>(
      path: '/dashboard',
    ),
    TypedGoRoute<AssetsRoute>(
      path: '/assets',
    ),
    TypedGoRoute<BookingRoute>(
      path: '/booking',
    ),
    TypedGoRoute<SellCarsRoute>(
      path: '/sell-cars',
    ),
    TypedGoRoute<BuyCarsRoute>(
      path: '/buy-cars',
    ),
    TypedGoRoute<ServicesRoute>(
      path: '/services',
    ),
    TypedGoRoute<CalenderRoute>(
      path: '/calender',
    ),
    TypedGoRoute<MessagesRoute>(
      path: '/messages',
    ),
    TypedGoRoute<SettingRoute>(
      path: '/setting',
    ),
  ],
)
class HomeRoute extends ShellRouteData {
  const HomeRoute();

  @override
  Page<void> pageBuilder(
    BuildContext context,
    GoRouterState state,
    Widget navigator,
  ) =>
      MaterialPage(
        child: HomePage(
          child: navigator,
        ),
      );
}

class DashboardRoute extends GoRouteData {
  const DashboardRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DashboardPage();
}

class AssetsRoute extends GoRouteData {
  const AssetsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const AssetsPage();
}

class BookingRoute extends GoRouteData {
  const BookingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const BookingPage();
}

class SellCarsRoute extends GoRouteData {
  const SellCarsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SellCarsPage();
}

class BuyCarsRoute extends GoRouteData {
  const BuyCarsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const BuyCarsPage();
}

class ServicesRoute extends GoRouteData {
  const ServicesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ServicesPage();
}

class CalenderRoute extends GoRouteData {
  const CalenderRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CalenderPage();
}

class MessagesRoute extends GoRouteData {
  const MessagesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const MessagesPage();
}

class SettingRoute extends GoRouteData {
  const SettingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingPage();
}
