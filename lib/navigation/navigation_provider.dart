import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  NavigationProvider();

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeIndex(int newIndex) async {
    _currentIndex = newIndex;
    notifyListeners();
  }
}
