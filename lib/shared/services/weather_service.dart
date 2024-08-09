
// import 'package:dio/dio.dart';

// class WeatherService {
//   final String apiKey = 'ef344ee3be267dfb1585822a324116a1';
//   final Dio _dio = Dio();

//   Future<Map<String, dynamic>> fetchWeather(double lat, double lon) async {
//     try {
//       final response = await _dio.get(
//         'https://api.openweathermap.org/data/2.5/onecall',
//         queryParameters: {
//           'lat': lat,
//           'lon': lon,
//           'appid': apiKey,
//           'units':
//               'metric', // Use 'metric' for Celsius, 'imperial' for Fahrenheit
//         },
//       );

//       if (response.statusCode == 200) {
//         return response.data;
//       } else {
//         print('Failed to load weather data');
//         return {};
//       }
//     } catch (e) {
//       print('Error fetching weather data: $e');
//       return {};
//     }
//   }
// }
import 'package:weather/weather.dart';

class WeatherService {
  final WeatherFactory _weatherFactory;

  WeatherService()
      : _weatherFactory =
            WeatherFactory('ef344ee3be267dfb1585822a324116a1', language: Language.ENGLISH);

  Future<Weather> fetchWeather(double latitude, double longitude) async {
    return await _weatherFactory.currentWeatherByLocation(latitude, longitude);
  }
}


