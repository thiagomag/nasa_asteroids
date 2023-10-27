import 'dart:convert';
import 'asteroid.dart';
import 'package:http/http.dart' as http;

class AsteroidsApi {
  static const String _baseUrl = "https://api.nasa.gov/neo/rest/v1/feed";
  static const String _apiKey = "EU7TfjpJKu6R2M8vhEC4S6DV1ZLkWAOsfOrz7LIB";

  static Future<List<Asteroid>> getAsteroids() async {
    final Uri url = Uri.parse(
        "$_baseUrl?start_date=2023-07-20&end_date=2023-07-26&api_key=$_apiKey");
    final response = await http.get(url);

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