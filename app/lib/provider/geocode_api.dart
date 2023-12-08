import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:markt/domain/localisation.dart';

class GeoCodeApi {
  Future<Localisation> fetchLocalisation(String long, String lat) async {
    final response = await http.get(Uri.parse('https://geocode.maps.co/reverse?lat=${lat}&lon=${long}'));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      Localisation localisation = Localisation.fromJson(jsonResponse);
      return localisation;
    } else {
      throw Exception('Failed to load categories from API');
    }
  }
}
