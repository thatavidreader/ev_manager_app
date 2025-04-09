import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/models/station.dart';
import '../providers/nearby_stations_provider.dart';
import 'station_card.dart';

class ChargingStationsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stationProvider = Provider.of<NearbyStationsProvider>(context);
    final stations = stationProvider.stations;

    // Sort stations by distance
    stations.sort((a, b) => a.distanceInKm!.compareTo(b.distanceInKm!));

    // Take only the top 3 nearest stations
    final nearestStations = stations.take(3).toList();

    return nearestStations.isEmpty
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: nearestStations.map((station) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.9,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: StationCard(
                  name: station.name,
                  distance: "${station.distanceInKm!.toStringAsFixed(1)} km",
                ),
              );
            }).toList(),
          );
  }
}
