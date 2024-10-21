import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_themes.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _currentTheme = AppThemes.light();

  ThemeData get currentTheme => _currentTheme;

  bool get isLight => _currentTheme == AppThemes.light();

  ThemeProvider() {
    _loadTheme();
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDark = prefs.getBool('isDark') ?? false;

    _currentTheme = isDark ? AppThemes.dark() : AppThemes.light();
    notifyListeners();
  }

  void toggleToLight() async {
    if (_currentTheme == AppThemes.dark()) toggleTheme();
  }

  void toggleToDark() async {
    if (_currentTheme == AppThemes.light()) toggleTheme();
  }

  void toggleTheme() async {
    _currentTheme = _currentTheme == AppThemes.light()
        ? AppThemes.dark()
        : AppThemes.light();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', _currentTheme == AppThemes.dark());

    notifyListeners();
  }
}
