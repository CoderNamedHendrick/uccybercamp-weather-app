import 'package:flutter/material.dart';
import 'package:uccybercampweatherapp/home.dart';

Future<void> main() async {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UCCyberCamp WeatherApp',
      home: Home(),
    );
  }
}
