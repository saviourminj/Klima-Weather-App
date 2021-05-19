import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klima_weather/model/weatherForecastModel.dart';
import 'package:klima_weather/network/network.dart';
import 'ui/main_display.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WeatherForecast(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherForecastModel> forecastObject ;
  final String defaultCity = 'New Delhi';
  @override
  void initState() {
    super.initState();
    forecastObject = Network().getWeather(cityName: defaultCity);
    // print(forecastObject);
    forecastObject.then((weather) => {  //try'n'catch for async operations
      // here weather is an object WeatherForecastModel
      print(weather.list[0].weather[0].description)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Klima'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent.shade400,
        leading: Icon(Icons.location_city),
      ),
      body: Display(forecastObject: forecastObject,
      cityNameField: defaultCity,),
      backgroundColor: Colors.grey.shade200,
    );
  }
}





