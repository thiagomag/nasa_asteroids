import 'dart:convert';
import 'asteroid.dart';

class AsteroidsApi {
  static const String _BASE_URL = "https://api.nasa.gov/neo/rest/v1/";

  static Future<List<Asteroid>> getAsteroids() async {
    final response = await http.get(Uri.parse(_BASE_URL + "feed"));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      return json["near_earth_objects"].map((obj) {
        return Asteroid.fromJson(obj);
      }).toList();
    } else {
      throw Exception("Failed to get asteroids");
    }
  }
}