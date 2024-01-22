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

class ThemeManager with ChangeNotifier {
  static final ThemeManager _instance = ThemeManager._internal();

  factory ThemeManager() {
    return _instance;
  }

  ThemeManager._internal();

  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
