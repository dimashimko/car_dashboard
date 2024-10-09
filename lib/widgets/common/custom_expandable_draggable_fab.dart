import 'package:draggable_expandable_fab/draggable_expandable_fab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../resources/theme/theme_provider.dart';

class CustomExpandableFab extends StatelessWidget {
  const CustomExpandableFab({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandableDraggableFab(
      childrenCount: 1,
      distance: 80.0,
      childrenType: ChildrenType.columnChildren,
      childrenAlignment: Alignment.bottomRight,
      enableChildrenAnimation: false,
      initialDraggableOffset: Offset(
        0.0,
        MediaQuery.of(context).size.height - 65.0,
      ),
      childrenMargin: const EdgeInsets.only(
        right: 5.0,
        bottom: 65.0,
      ),
      childrenInnerMargin: const EdgeInsets.all(5.0),
      openWidget: Container(
        width: 50.0,
        height: 50.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blueGrey,
        ),
        child: const Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ),
      closeWidget: Container(
        width: 50.0,
        height: 50.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 3.0,
            ),
          ],
        ),
        child: const Icon(
          Icons.close,
          color: Colors.black,
        ),
      ),
      children: [
        Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              backgroundColor: Colors.white,
              onPressed: () {
                themeProvider.toggleTheme();
              },
              child: const Text(
                'Switch Theme',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
