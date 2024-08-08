import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  final String apiKey = 'ef344ee3be267dfb1585822a324116a1';

  Future<List<Map<String, dynamic>>> fetchWeather(
      List<Map<String, dynamic>> locations) async {
    List<Map<String, dynamic>> weatherData = [];
    for (var location in locations) {
      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=${location['city']},${location['state']},${location['country']}&appid=$apiKey'));

      if (response.statusCode == 200) {
        weatherData.add(json.decode(response.body));
      } else {
        print('Failed to load weather data');
      }
    }
    return weatherData;
  }
}
