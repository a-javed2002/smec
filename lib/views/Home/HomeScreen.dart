
import 'package:flutter/material.dart';
import 'package:smec/views/Home/list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedToggleIndex = 0; // Track the selected toggle index

  List<Map<String, dynamic>> cardData = [
    {'count': 10, 'icon': Icons.document_scanner, 'text': 'Purchase Requisition'},
    {'count': 5, 'icon': Icons.addchart, 'text': 'Purchase Order'},
    {'count': 8, 'icon': Icons.monetization_on, 'text': 'Sales'},
    {'count': 15, 'icon': Icons.description, 'text': 'Invoice'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/DASHBOARD.png',
              fit: BoxFit.cover,
            ),
          ),

          // Content Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dashboard Heading
              Container(
                margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    ),
                    Center(
                      child: Text(
                        'Dashboard',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                        radius: 20,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10,),

              // Custom Toggle Bar
              Container(
                margin: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                decoration: BoxDecoration(
                  color: Color(0xFF424242),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildToggleButton('All', 0),
                    _buildToggleButton('Sales', 1),
                    _buildToggleButton('Purchase', 2),
                  ],
                ),
              ),

              // Grid View for Cards
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: cardData.length,
                  itemBuilder: (context, index) {
                    return _buildCard(
                      count: cardData[index]['count'],
                      icon: cardData[index]['icon'],
                      text: cardData[index]['text'],
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListScreen()),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String text, int index) {
    bool isSelected = selectedToggleIndex == index;

    return GestureDetector(
      onTap: () {
        print('Selected Toggle: $text');
        setState(() {
          selectedToggleIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected
              ? Color.fromARGB(255, 66, 110, 255)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
  required int count,
  required IconData icon,
  required String text,
  required VoidCallback onPress,
}) {
  return GestureDetector(
    onTap: onPress,
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$count',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 10), // Adjust the spacing as needed
                Container(
                  width: 60, // Adjust the width of the circle as needed
                  height: 60, // Adjust the height of the circle as needed
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Icon(
                    icon,
                    size: 40,
                    color: Colors.white, // Adjust the color as needed
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 2, // Adjust the thickness of the line as needed
            ),
          ],
        ),
      ),
    ),
  );
}

}