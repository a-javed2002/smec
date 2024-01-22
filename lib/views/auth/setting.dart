// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:smec/theme/theme_manager.dart';

// class MySettingsScreen extends StatefulWidget {
//   const MySettingsScreen({Key? key}) : super(key: key);

//   @override
//   _MySettingsScreenState createState() => _MySettingsScreenState();
// }

// class _MySettingsScreenState extends State<MySettingsScreen> {
//   late SharedPreferences _prefs;
//   late ThemeManager _themeManager;

//   @override
//   void initState() {
//     super.initState();
//     _initializePreferences();
//   }

//   Future<void> _initializePreferences() async {
//     _prefs = await SharedPreferences.getInstance();
//     _themeManager = ThemeManager(initialThemeMode: _getSavedThemeMode());
//   }

//   ThemeMode _getSavedThemeMode() {
//     return _prefs.containsKey('themeMode')
//         ? ThemeMode.values[_prefs.getInt('themeMode') ?? 0]
//         : ThemeMode.system;
//   }

//   void _saveThemeMode(ThemeMode themeMode) {
//     _prefs.setInt('themeMode', themeMode.index);
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     TextTheme _textTheme = Theme.of(context).textTheme;
//     ThemeManager _themeManager = ThemeManager();
//     bool isDark = Theme.of(context).brightness == Brightness.dark;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Theme App"),
//         actions: [
//           Switch(
//               value: _themeManager.themeMode == ThemeMode.dark,
//               onChanged: (newValue) {
//                 setState(() {
//                   _themeManager.toggleTheme(newValue);
//                 _saveThemeMode(_themeManager.themeMode);
//                 });
//               })
//         ],
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               ListTile(
//                 title: Text('Dark Theme'),
//                 trailing: Switch(
//                     value: _themeManager.themeMode == ThemeMode.dark,
//                     onChanged: (newValue) {
//                       _themeManager.toggleTheme(newValue);
//                     }),
//                 leading: Icon(Icons.nightlight_round),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(child: Text("Just Click"), onPressed: () {}),
//               SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(child: Text("Click Me"), onPressed: () {}),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: Theme(
//         data: Theme.of(context).copyWith(splashColor: Colors.blue), // For Test
//         child: FloatingActionButton(
//           child: Icon(Icons.add),
//           onPressed: () {},
//         ),
//       ),
      
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:smec/theme/theme_manager.dart';

class MySettingsScreen extends StatefulWidget {
  const MySettingsScreen({Key? key}) : super(key: key);

  @override
  _MySettingsScreenState createState() => _MySettingsScreenState();
}

class _MySettingsScreenState extends State<MySettingsScreen> {
  late ThemeManager _themeManager;

  @override
  void initState() {
    super.initState();
    _themeManager = ThemeManager();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme App"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                title: Text('Dark Theme'),
                trailing: Switch(
                  value: _themeManager.themeMode == ThemeMode.dark,
                  onChanged: (newValue) {
                    setState(() {
                      _themeManager.toggleTheme(newValue);
                    });
                  },
                ),
                leading: Icon(Icons.nightlight_round),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("Just Click"),
                onPressed: () {},
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("Click Me"),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
