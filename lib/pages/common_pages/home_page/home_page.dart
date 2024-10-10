import 'package:car_dashboard/pages/common_pages/home_page/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

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
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 50.0,
                    color: Colors.orange,
                  ),
                  Expanded(child: widget.child),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
