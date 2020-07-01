import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_config/flutter_config.dart';

const apiURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  String apiKey = FlutterConfig.get('API_KEY');
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkWeather networkWeather =
        NetworkWeather('$apiURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkWeather.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    String apiKey = FlutterConfig.get('API_KEY');
    Location location = Location();
    await location.getCurrentLocation();

    NetworkWeather networkWeather = NetworkWeather(
        '$apiURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkWeather.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
