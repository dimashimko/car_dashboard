import 'package:flutter/material.dart';

class ResponsiveText extends StatelessWidget {
  final String text;

  const ResponsiveText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Adjust the font size based on the screen width
    double fontSize = MediaQuery.of(context).size.width * 0.05;

    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
      ),
    );
  }
}
