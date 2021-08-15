import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccybercampweatherapp/api.dart';
import 'package:uccybercampweatherapp/json2dart.dart';

class WeatherInfo extends StatefulWidget {
  final String searchName;
  const WeatherInfo({Key? key, required this.searchName}) : super(key: key);

  @override
  _WeatherInfoState createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  ApiService _apiService = ApiService();
  var response;

  @override
  void initState() {
    super.initState();
    response = _apiService.get(
      searchName: widget.searchName,
      appId: '0b034dbf05b60fd2bd9f30cdd0e08748',
    );
  }

  IconData getWeatherIcon(String? weather) {
    if (weather == 'Rain') {
      return FontAwesomeIcons.cloudRain;
    }
    return FontAwesomeIcons.cloud;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: response,
      initialData: DailyForecast.initialData(),
      builder: (context, snapshot) {
        var deviceSize = MediaQuery.of(context).size;
        if (snapshot.data == null) {
          return Scaffold(
            body: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: deviceSize.height,
                width: deviceSize.width,
                color: Colors.transparent,
                child: Center(
                  child: Text(
                    'You entered a wrong search query',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        final DailyForecast weatherData = DailyForecast.fromJson(snapshot.data);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple[800],
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.chevron_left_outlined,
                size: 42,
              ),
            ),
          ),
          body: Column(
            children: [
              Container(
                height: deviceSize.height / 2,
                width: deviceSize.width,
                color: Colors.deepPurple[800],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FaIcon(
                      getWeatherIcon(weatherData.weather),
                      size: 150,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      '${weatherData.weather}',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.deepOrange,
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_pin,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        '${weatherData.name}',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        '${weatherData.country}',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.caretUp,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            '${weatherData.tempMax}\u2103',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Row(
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.caretDown,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            '${weatherData.tempMin}\u2103',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                '${weatherData.temp}\u00B0',
                                style: TextStyle(
                                  fontSize: 64,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 18),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Pressure',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                        ),
                                      ),
                                      Text(
                                        '${weatherData.pressure}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                        ),
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.cloud,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  color: Colors.purpleAccent[700],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 18),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Humidity',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                        ),
                                      ),
                                      Text(
                                        '${weatherData.humidity}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                        ),
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.water,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  color: Colors.yellow[400],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 18),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Wind Speed',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                        ),
                                      ),
                                      Text(
                                        '${weatherData.windSpeed}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                        ),
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.wind,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  color: Colors.deepOrange[400],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
