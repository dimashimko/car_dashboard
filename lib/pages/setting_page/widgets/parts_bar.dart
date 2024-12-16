import 'package:car_dashboard/pages/setting_page/widgets/parts_bar_card.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';

class PartsBar extends StatefulWidget {
  const PartsBar({super.key});

  @override
  State<PartsBar> createState() => _PartsBarState();
}

class _PartsBarState extends State<PartsBar> {
  int currentIndex = 0;
  final List<String> categories = [
    'My details',
    'Profile',
    'Password',
    'Email',
    'Notification',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SeparatedRow(
        separatorBuilder: () {
          return const SizedBox(
            width: 48.0,
          );
        },
        children: categories.asMap().entries.map(
          (entry) {
            final index = entry.key;
            final category = entry.value;
            return PartsBarCard(
              text: category,
              isSelected: currentIndex == index,
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
            );
          },
        ).toList(),
      ),
    );
  }
}
