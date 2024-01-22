import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  // Dummy product data
  List<Product> products = [
    Product(
      name: 'PR-10050182',
      date: '01/12/2021',
      location: 'PL01-Texas Houston',
      price: 50.0,
    ),
    Product(
      name: 'PR-10050183',
      date: '02/15/2021',
      location: 'PL02-New York',
      price: 75.0,
    ),
    Product(
      name: 'PR-10050184',
      date: '03/20/2021',
      location: 'PL03-California Los Angeles',
      price: 120.0,
    ),
    Product(
      name: 'PR-10050185',
      date: '04/25/2021',
      location: 'PL04-Florida Miami',
      price: 90.0,
    ),
    Product(
      name: 'PR-10050186',
      date: '05/30/2021',
      location: 'PL05-Illinois Chicago',
      price: 60.0,
    ),
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
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                    Center(
                      child: Text(
                        'List Of Card',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  children: [
                    // Search Bar
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: Color(0xFF424242),
                            ),
                            icon: Icon(
                              Icons.search,
                              color: Color(0xFF424242),
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            color: Color(0xFF424242),
                          ),
                        ),
                      ),
                    ),
                    // Add any other icons or widgets as needed in the search bar area
                  ],
                ),
              ),

              // Product Tiles
              Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: products.map((product) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Icon for product name
                            Row(
                              children: [
                                Icon(Icons.shopping_cart, color: Colors.blue),
                                SizedBox(width: 8),
                                Text(product.name),
                              ],
                            ),
                            // Icon for date
                            Row(
                              children: [
                                Icon(Icons.calendar_today, color: Colors.green),
                                SizedBox(width: 8),
                                Text('${product.date}'),
                              ],
                            ),
                          ],
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Icon for location
                            Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.orange),
                                SizedBox(width: 8),
                                Text('${product.location}'),
                              ],
                            ),
                            // Icon for price
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 91, 47, 196),
                                borderRadius: BorderRadius.circular(
                                    10.0), // Adjust the value as needed
                              ),
                              padding: EdgeInsets.all(6),
                              child: Row(
                                children: [
                                  Icon(Icons.attach_money, color: Colors.white),
                                  SizedBox(width: 4),
                                  Text('${product.price}',
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Add onTap to handle tile tap
                        onTap: () {
                          // Handle tile tap
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String date;
  final String location;
  final double price;

  Product(
      {required this.name,
      required this.date,
      required this.location,
      required this.price});
}
