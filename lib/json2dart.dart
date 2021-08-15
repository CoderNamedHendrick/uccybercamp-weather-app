class DailyForecast {
  double temp;
  int pressure;
  int humidity;
  double windSpeed;
  String weather;
  String name;
  String country;

  DailyForecast({
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.weather,
    required this.name,
    required this.country,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> jsonData) {
    return DailyForecast(
      temp: jsonData['main']['temp'],
      pressure: jsonData['main']['pressure'],
      humidity: jsonData['main']['humidity'],
      windSpeed: jsonData['wind']['speed'],
      weather: jsonData['weather'][0]['main'],
      name: jsonData['name'],
      country: jsonData['sys']['country'],
    );
  }
}
