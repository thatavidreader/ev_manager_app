import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/station.dart';

class ChargingStationService {
  static const String apiUrl = 'https://api.openchargemap.io/v3/poi';
  static const String apiKey = 'f749285a-aa90-43d1-9b55-082b009c9281';

  Future<List<Station>> fetchStations({
    required double lat,
    required double lon,
    required double radiusInKm,
  }) async {
    final uri = Uri.parse('$apiUrl'
        '?output=json'
        '&latitude=$lat'
        '&longitude=$lon'
        '&distance=$radiusInKm'
        '&distanceunit=KM'
        '&maxresults=20'
        '&compact=true'
        '&verbose=false'
        '&key=$apiKey');

    final response = await http.get(
      uri,
      headers: {
        'User-Agent':
            'EVManagerApp/1.0 (messytomato@example.com)', // 🚨 Must add
      },
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((station) => Station.fromJson(station)).toList();
    } else {
      print("API Error: ${response.statusCode} - ${response.body}");
      throw Exception('Failed to load stations');
    }
  }
}
