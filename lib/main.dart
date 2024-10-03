import 'package:flutter/material.dart';
import 'city_weather_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Прогноз погоди',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        hintColor: Colors.white,
      ),
      home: CitySelectionScreen(),
    );
  }
}

class CitySelectionScreen extends StatelessWidget {
  final List<String> cities = ['Київ', 'Одеса', 'Львів', 'Івано-Франківськ'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Виберіть місто'),
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              cities[index],
              style: TextStyle(fontSize: 20),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CityWeatherScreen(city: cities[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}



