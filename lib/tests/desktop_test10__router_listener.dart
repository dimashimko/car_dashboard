// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   late GoRouter _router;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Access the GoRouter instance
//     _router = GoRouter.of(context);
//
//     // Add listener for route changes
//     _router.addListener(_onRouteChanged);
//   }
//
//   // Callback for when the route changes
//   void _onRouteChanged() {
//     print('Route changed: ${_router.location}');
//     // You can handle the route changes here
//   }
//
//   @override
//   void dispose() {
//     // Remove the listener when the widget is disposed
//     _router.removeListener(_onRouteChanged);
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerDelegate: _router.routerDelegate,
//       routeInformationParser: _router.routeInformationParser,
//     );
//   }
// }
