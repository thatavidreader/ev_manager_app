class Station {
  final String name;
  final double lat;
  final double lon;
  double? distanceInKm;

  Station({
    required this.name,
    required this.lat,
    required this.lon,
    this.distanceInKm,
  });

  factory Station.fromJson(Map<String, dynamic> json) {
    final address = json['AddressInfo'];
    return Station(
      name: address['Title'] ?? 'Unknown Station',
      lat: (address['Latitude'] ?? 0).toDouble(),
      lon: (address['Longitude'] ?? 0).toDouble(),
      distanceInKm: (address['Distance'] ?? 0).toDouble(),
    );
  }
}
