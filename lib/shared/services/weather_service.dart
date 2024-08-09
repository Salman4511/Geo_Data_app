
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


