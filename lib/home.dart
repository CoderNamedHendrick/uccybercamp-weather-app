import 'package:flutter/material.dart';
import 'package:uccybercampweatherapp/weather_info.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  Color? pageColor = Colors.purple[700];
  TextEditingController? _searchController = TextEditingController();

  _goToWeatherInfo(BuildContext context, String search) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WeatherInfo(
          searchName: search,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pageColor,
        elevation: 0,
        title: const Text('Weather App'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Get Weather Info on any city in the World',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _searchController,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                cursorColor: pageColor,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'City Name',
                  border: InputBorder.none,
                  labelStyle: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
            ),
            GestureDetector(
              onTap: () =>
                  _goToWeatherInfo(context, _searchController!.value.text),
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(75),
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.search,
                  size: 45,
                  color: pageColor,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: pageColor,
    );
  }
}
