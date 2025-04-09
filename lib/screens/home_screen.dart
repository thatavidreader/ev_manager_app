import 'package:flutter/material.dart';
import '../widgets/vehicle_status_widget.dart';
import '../widgets/charging_stations_list.dart';
import 'charging_map.dart';
import 'profile_screen.dart'; // ✅ Import the profile screen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Column(
      children: [
        VehicleStatusWidget(),
        SizedBox(height: 20),
        ChargingStationsList(),
      ],
    ),
    ChargingMapScreen(),
    ProfileScreen(), // ✅ Replaced placeholder with actual screen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EV Manager')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.white60,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.ev_station), label: "Stations"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
