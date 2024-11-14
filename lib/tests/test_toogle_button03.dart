import 'package:flutter/material.dart';

class ToggleButtonList extends StatefulWidget {
  final List<String> options;

  const ToggleButtonList({super.key, required this.options});

  @override
  State<ToggleButtonList> createState() => _ToggleButtonListState();
}

class _ToggleButtonListState extends State<ToggleButtonList> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.options.map((option) {
        final index = widget.options.indexOf(option);
        return Expanded(
          child: TextButton(
            onPressed: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black),
              backgroundColor: MaterialStateProperty.all(
                _selectedIndex == index ? Colors.blue : Colors.grey,
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            child: Text(option),
          ),
        );
      }).toList(),
    );
  }
}
