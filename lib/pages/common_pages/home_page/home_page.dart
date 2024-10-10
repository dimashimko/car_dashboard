import 'package:car_dashboard/pages/common_pages/home_page/widgets/custom_app_bar.dart';
import 'package:car_dashboard/pages/common_pages/home_page/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            const CustomDrawer(),
            const Gap(1.0),
            Expanded(
              child: Column(
                children: [
                  const CustomAppBar(),
                  Expanded(
                    child: widget.child,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
