import 'package:car_dashboard/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'SignInPage',
                ),
                const Gap(16.0),
                ElevatedButton(
                  onPressed: () {
                    const DashboardRoute().go(context);
                  },
                  child: const Text(
                    'SignIn',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
