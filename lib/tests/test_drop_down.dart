import 'package:car_dashboard/generated/assets.gen.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TaskBoardDropdown(),
    );
  }
}

class TaskBoardDropdown extends StatefulWidget {
  const TaskBoardDropdown({super.key});

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Dropdown Example'),
      ),
      body: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: Colors.blue, // Set the background color here
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: DropdownButton<String>(
              value: selectedValue,
              dropdownColor: Colors.blue,
              borderRadius: BorderRadius.circular(12.0),
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
          ),
        ],
      ),
    );
  }
}
