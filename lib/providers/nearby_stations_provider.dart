import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import '../services/charging_station_service.dart';
import '../services/models/station.dart';

class NearbyStationsProvider extends ChangeNotifier {
  List<Station> _stations = [];
  List<Station> get stations => _stations;

  Future<void> fetchNearbyStations() async {
    // Get current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    double radiusInKm = 10; // Can be dynamic based on battery level later

    List<Station> fetched = await ChargingStationService().fetchStations(
      lat: position.latitude,
      lon: position.longitude,
      radiusInKm: radiusInKm,
    );

    // Calculate distance for each station
    final Distance distance = Distance();
    final userLocation = LatLng(position.latitude, position.longitude);

    for (var station in fetched) {
      final stationLocation = LatLng(station.lat, station.lon);
      final double km =
          distance.as(LengthUnit.Kilometer, userLocation, stationLocation);
      station.distanceInKm = double.parse(km.toStringAsFixed(2));
    }

    // Sort stations by distance
    fetched.sort((a, b) => a.distanceInKm!.compareTo(b.distanceInKm!));

    _stations = fetched;
    notifyListeners();
  }
}
