import 'package:flutter/material.dart';

class VehicleStatusWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black87,
      child: ListTile(
        title: Text('Vehicle Status', style: TextStyle(color: Colors.white)),
        subtitle: Text('Charge Left: 80% | Distance Traveled: 120 km', style: TextStyle(color: Colors.white70)),
      ),
    );
  }
}
