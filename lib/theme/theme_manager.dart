// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class ThemeManager with ChangeNotifier{

//   ThemeMode _themeMode = ThemeMode.light;

//   get themeMode => _themeMode;

//   toggleTheme(bool isDark){
//     _themeMode = isDark?ThemeMode.dark:ThemeMode.light;
//     notifyListeners();
//   }

// }


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager with ChangeNotifier {
  static final ThemeManager _instance = ThemeManager._internal();

  factory ThemeManager() {
    return _instance;
  }

  ThemeManager._internal() {
    _loadThemeMode();
  }

  late ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  Future<void> _loadThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _themeMode = _getSavedThemeMode(prefs);
    notifyListeners();
  }

  ThemeMode _getSavedThemeMode(SharedPreferences prefs) {
    return prefs.containsKey('themeMode')
        ? ThemeMode.values[prefs.getInt('themeMode') ?? 0]
        : ThemeMode.light;
  }

  Future<void> _saveThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('themeMode', _themeMode.index);
  }

  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    _saveThemeMode();
    notifyListeners();
  }
}

