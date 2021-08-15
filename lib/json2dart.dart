class DailyForecast {
  double? temp;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  double? windSpeed;
  String? weather;
  String? name;
  String? country;

  DailyForecast({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
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
      tempMin: jsonData['main']['temp_min'],
      tempMax: jsonData['main']['temp_max'],
      pressure: jsonData['main']['pressure'],
      humidity: jsonData['main']['humidity'],
      windSpeed: jsonData['wind']['speed'],
      weather: jsonData['weather'][0]['main'],
      name: jsonData['name'],
      country: jsonData['sys']['country'],
    );
  }

  static initialData() {
    return {
      "weather": [
        {
          "main": "Clear",
        }
      ],
      "main": {
        "temp": 9.4,
        "temp_min": 7.22,
        "temp_max": 11.11,
        "pressure": 1023,
        "humidity": 100
      },
      "wind": {
        "speed": 1.5,
      },
      "sys": {
        "country": "US",
      },
      "name": "Mountain View",
    };
  }
}
