import 'package:flutter/material.dart';

class CustomPlanner extends StatelessWidget {
  final List<String> timeSlots = [
    '08:00 AM',
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    // Add more slots
  ];
  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Planner')),
      body: Row(
        children: [
          // Time column
          Column(
            children: timeSlots.map((slot) {
              return Container(
                height: 60, // Adjust for slot height
                width: 80,
                alignment: Alignment.center,
                child: Text(slot),
              );
            }).toList(),
          ),
          // Days grid
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: days.length, // Columns for days
                childAspectRatio: 2, // Adjust aspect ratio
              ),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(4),
                  color: Colors.grey.shade200,
                  child: Center(
                    child: Text('Event $index'),
                  ),
                );
              },
              itemCount: days.length * timeSlots.length, // Total slots
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: CustomPlanner()));
}
