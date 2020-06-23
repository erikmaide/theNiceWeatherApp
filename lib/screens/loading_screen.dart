import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:clima/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longitude;
  double latitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    String apiKey = FlutterConfig.get('API_KEY');
    Location location = Location();

    await location.getCurrentLocation();
    double latitude = location.latitude;
    double longitude = location.longitude;
    NetworkWeather networkWeather = NetworkWeather(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData = await networkWeather.getData();
    print(weatherData['name']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
