import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Cari Destinasi",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text("26°C", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(width: 10),
                  Chip(label: Text("Hangat")),
                  Spacer(),
                  Text("Jakarta", style: TextStyle(fontWeight: FontWeight.bold)),
                  Icon(Icons.location_on),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCategoryIcon(Icons.directions_bus, "Bus"),
                  _buildCategoryIcon(Icons.train, "Kereta"),
                  _buildCategoryIcon(Icons.airplanemode_active, "Pesawat"),
                ],
              ),
              SizedBox(height: 20),
              Text("Destinasi Teratas", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("Nikmati Perjalanan Anda Bersama Kami di TiketHub!"),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDestinationCard("JAKARTA → BALI", "Rp.1.900.000"),
                  _buildDestinationCard("JAKARTA → LOMBOK", "Rp.1.800.000"),
                ],
              ),
              SizedBox(height: 20),
              Text("Promo Wisata", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Container(
                height: 150,
                color: Colors.grey[300], // Placeholder untuk gambar promo
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[300], // Placeholder untuk icon
          child: Icon(icon, size: 30, color: Colors.black),
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }

  Widget _buildDestinationCard(String route, String price) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[300], // Placeholder untuk gambar
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.calendar_today, size: 14),
                SizedBox(width: 5),
                Text("25 Februari 2026", style: TextStyle(fontSize: 12)),
              ],
            ),
            SizedBox(height: 5),
            Text(route, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("Mulai dari"),
            Text(price, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
