import 'package:flutter/material.dart';
import 'home_bus.dart'; // Impor halaman BusTravelPage

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/awan.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Cari Destinasi",
                                prefixIcon: Icon(Icons.search),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          IconButton(
                            icon: Icon(Icons.notifications, color: Colors.white),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "26°C",
                            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          SizedBox(width: 10),
                          Chip(
                            backgroundColor: Colors.white,
                            label: Row(
                              children: [
                                Icon(Icons.wb_sunny, color: Colors.orange, size: 16),
                                SizedBox(width: 5),
                                Text("Hangat"),
                              ],
                            ),
                          ),
                          Spacer(),
                          Chip(
                            backgroundColor: Colors.white,
                            label: Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.blue, size: 16),
                                Text("Jakarta"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCategoryIcon(context, Icons.directions_bus, "Bus", BusTravelPage()),
                      _buildCategoryIcon(context, Icons.train, "Kereta", null),
                      _buildCategoryIcon(context, Icons.airplanemode_active, "Pesawat", null),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Destinasi Teratas", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("Nikmati Perjalanan Anda Bersama Kami di TiketHub!"),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDestinationCard("JAKARTA → BALI", "Rp.1.900.000", "assets/bali.png"),
                      _buildDestinationCard("JAKARTA → LOMBOK", "Rp.1.800.000", "assets/lombok.jpg"),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildCategoryIcon(BuildContext context, IconData icon, String label, Widget? page) {
  return GestureDetector(
    onTap: () {
      if (page != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    },
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
          ),
          child: Icon(icon, size: 30, color: Colors.black),
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    ),
  );
}


  Widget _buildDestinationCard(String route, String price, String imagePath) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(imagePath, height: 100, fit: BoxFit.cover),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                SizedBox(width: 5),
                Text("25 Februari 2026", style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
            SizedBox(height: 5),
            Text(route, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("Mulai dari", style: TextStyle(color: Colors.grey)),
            Text(price, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}