import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive MacOS App',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Adaptive Layout Example'),
      ),
      body: Center(
        child: Container(
          width: size.width > 800
              ? 400
              : size.width * 0.9, // Example responsive width
          height: size.height > 600
              ? 300
              : size.height * 0.7, // Example responsive height
          color: Colors.blue,
          child: Center(
            child: Text(
              'Screen Width: ${size.width}, Screen Height: ${size.height}',
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
