import 'package:flutter/material.dart';
import 'weather_service.dart';

class CityWeatherScreen extends StatefulWidget {
  final String city;

  CityWeatherScreen({required this.city});

  @override
  _CityWeatherScreenState createState() => _CityWeatherScreenState();
}

class _CityWeatherScreenState extends State<CityWeatherScreen> {
  final WeatherService _weatherService = WeatherService();
  Map<String, dynamic>? weatherData;

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  Future<void> _fetchWeather() async {
    try {
      final data = await _weatherService.getWeather(widget.city);
      setState(() {
        weatherData = data;
      });
    } catch (e) {
      print('Помилка: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Погода в ${widget.city}'),
      ),
      body: weatherData == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Температура: ${weatherData!['main']['temp'].round()} °C',
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 20),
            Text(
              'Відчувається як: ${weatherData!['main']['feels_like'].round()} °C',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Опис: ${weatherData!['weather'][0]['description']}',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
