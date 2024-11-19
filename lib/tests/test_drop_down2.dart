import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DropdownExample(),
    );
  }
}

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String? selectedValue;
  final List<String> dropdownItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown with Fixed Width'),
      ),
      body: Center(
        child: Row(
          mainAxisSize:
              MainAxisSize.min, // Ensures the row is as small as possible
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: DropdownButton<String>(
                  underline: SizedBox(), // Remove underline
                  hint: Text('Select an item'),
                  value: selectedValue,
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
