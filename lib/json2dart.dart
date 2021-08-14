class DailyForecast {
  String temp;
  String pressure;
  String humidity;
  String windSpeed;

  DailyForecast({
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> jsonData) {
    return DailyForecast(
      temp: jsonData['main']['temp'] as String,
      pressure: jsonData['main']['pressure'] as String,
      humidity: jsonData['main']['humidity'] as String,
      windSpeed: jsonData['wind']['speed'] as String,
    );
  }
}
