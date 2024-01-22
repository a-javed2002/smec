import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:smec/theme/theme_manager.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    ThemeManager _themeManager = ThemeManager();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme App"),
        actions: [
          Switch(
              value: _themeManager.themeMode == ThemeMode.dark,
              onChanged: (newValue) {
                _themeManager.toggleTheme(newValue);
              })
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/profile_pic.png",
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Your Name",
                style: _textTheme.headline4?.copyWith(
                    color: isDark ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "@yourusername",
                style: _textTheme.subtitle1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "This is a simple Status",
              ),
              SizedBox(
                height: 20,
              ),
              TextField(),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(child: Text("Just Click"), onPressed: () {}),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(child: Text("Click Me"), onPressed: () {}),
            ],
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.blue), // For Test
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color.fromARGB(255, 36, 36, 36),
        animationDuration: Duration(milliseconds: 300),
        items: [
          Icon(Icons.person, color: Colors.white),
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.settings, color: Colors.white),
        ],
        // index: _currentIndex, // Use _currentIndex here
        index: 1, // Use _currentIndex here
        onTap: (index) {
          setState(() {
            // _currentIndex = index;
            // _pageController.animateToPage(
            //   index,
            //   duration: Duration(milliseconds: 300),
            //   curve: Curves.easeInOut,
            // );
          });
        },
      ),
    );
  }
}
