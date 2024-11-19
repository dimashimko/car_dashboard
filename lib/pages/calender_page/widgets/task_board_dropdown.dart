import 'package:flutter/material.dart';

import '../../../generated/assets.gen.dart';

class TaskBoardDropdown extends StatefulWidget {
  const TaskBoardDropdown({
    super.key,
    required this.backgroundColor,
  });

  final Color backgroundColor;

  @override
  TaskBoardDropdownState createState() => TaskBoardDropdownState();
}

class TaskBoardDropdownState extends State<TaskBoardDropdown> {
  String? selectedValue; // To store the selected value
  final List<String> dropdownItems = [
    'Week',
    'Day',
    'Year',
  ];

  @override
  void initState() {
    super.initState();
    if (dropdownItems.isNotEmpty) {
      selectedValue = dropdownItems.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33.0,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: widget.backgroundColor, // Set the background color here
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButton<String>(
        value: selectedValue,
        dropdownColor: widget.backgroundColor,
        borderRadius: BorderRadius.circular(10.0),
        items: dropdownItems.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue;
          });
        },
        icon: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Assets.icons.arrowDown.svg(),
        ),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        underline: const SizedBox(),
      ),
    );
  }
}
