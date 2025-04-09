import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ev_manager_app/services/charging_station_service.dart';
import 'package:ev_manager_app/services/models/station.dart';

class ChargingMapScreen extends StatefulWidget {
  @override
  _ChargingMapScreenState createState() => _ChargingMapScreenState();
}

class _ChargingMapScreenState extends State<ChargingMapScreen> {
  final mapController = MapController();
  Position? _currentPosition;
  List<Marker> _stationMarkers = [];

  @override
  void initState() {
    super.initState();
    _getLocationAndStations();
  }

  Future<void> _getLocationAndStations() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _currentPosition = position;
    });

    await _fetchStations(
      lat: position.latitude,
      lon: position.longitude,
      radiusInKm: 25.0, // Set radius based on estimated battery range
    );
  }

  Future<void> _fetchStations({
    required double lat,
    required double lon,
    required double radiusInKm,
  }) async {
    try {
      List<Station> stations = await ChargingStationService().fetchStations(
        lat: lat,
        lon: lon,
        radiusInKm: radiusInKm,
      );

      List<Marker> markers = stations.map((station) {
        return Marker(
          point: LatLng(
            station.lat,
            station.lon,
          ),
          width: 30,
          height: 30,
          child: Tooltip(
            message: station.name,
            child: Icon(Icons.ev_station,
                color: const Color.fromARGB(255, 11, 119, 117), size: 30),
          ),
        );
      }).toList();

      setState(() {
        _stationMarkers = markers;
      });
    } catch (e) {
      print('Error fetching stations: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Nearby Charging Stations"),
        backgroundColor: Colors.black,
      ),
      body: _currentPosition == null
          ? Center(child: CircularProgressIndicator())
          : FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter: LatLng(
                    _currentPosition!.latitude, _currentPosition!.longitude),
                initialZoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.ev_manager_app',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(
                        _currentPosition!.latitude,
                        _currentPosition!.longitude,
                      ),
                      width: 30,
                      height: 30,
                      child: Icon(Icons.person_pin_circle,
                          color: Colors.blueAccent, size: 30),
                    ),
                    ..._stationMarkers,
                  ],
                ),
              ],
            ),
    );
  }
}
