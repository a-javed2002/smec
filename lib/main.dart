// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:smec/firebase_options.dart';
// import 'package:smec/theme/theme_constants.dart';
// import 'package:smec/theme/theme_manager.dart';
// import 'package:smec/views/Home/home.dart';
// import 'package:smec/views/auth/splash_screen.dart';

// Future<void> main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(const MyApp());
// }

// ThemeManager _themeManager = ThemeManager();

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   void dispose() {
//     _themeManager.removeListener(themeListener);
//     super.dispose();
//   }

//   @override
//   void initState() {
//     _themeManager.addListener(themeListener);
//     super.initState();
//   }

//   themeListener(){
//     if(mounted){
//       setState(() {

//       });
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: lightTheme,
//       darkTheme: darkTheme,
//       themeMode: _themeManager.themeMode,
//       home: Home(),
//     );
//   }
// }


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smec/firebase_options.dart';
import 'package:smec/theme/theme_constants.dart';
import 'package:smec/theme/theme_manager.dart';
import 'package:smec/views/Home/home.dart';
import 'package:smec/views/auth/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  ThemeManager _themeManager = ThemeManager(); // Initialize ThemeManager

  runApp(MyApp(themeManager: _themeManager));
}

class MyApp extends StatefulWidget {
  final ThemeManager themeManager;

  const MyApp({Key? key, required this.themeManager}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    widget.themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    widget.themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: widget.themeManager.themeMode,
      home: Home(),
    );
  }
}
