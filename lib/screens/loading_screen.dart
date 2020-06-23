import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_config/flutter_config.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }

  void getData() async {
    String apiKey = FlutterConfig.get('API_KEY');
    http.Response response = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=$apiKey');
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      int condition = decodedData['weather'][0]['id'];
      double temperature = decodedData['main']['temp'];
      String city = decodedData['name'];
      print('The key values are: $city, $temperature, $condition');
    } else {
      print(response.statusCode);
    }
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
