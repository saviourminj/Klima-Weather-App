import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:klima_weather/model/weatherForecastModel.dart';
import 'package:klima_weather/utilities/forecast_util.dart';

class Network{
  Future<WeatherForecastModel> getWeather({String cityName}) async{
    String url = 'http://api.openweathermap.org/data/2.5/forecast?q=$cityName&cnt=8&appid=${Util.appID}&units=metric';

    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      print(response.statusCode);
      dynamic data = response.body;
      // print(data);
      dynamic weatherData = jsonDecode(data);
      // we get mapped JSON data (dart object) using WeatherForecastModel.fromJson
      return WeatherForecastModel.fromJson(weatherData);
    }else print(response.statusCode);

    return WeatherForecastModel.fromJson(jsonDecode(response.body));

  }
}

Future<WeatherForecastModel> getCityWeather({String cityNameFromField}) {
  var forecastObject = new Network().getWeather(cityName: cityNameFromField);
  dynamic cityWeatherForecast = forecastObject;
  forecastObject.then((weather) => {
    print(weather.list[0].dt)
  });
  return cityWeatherForecast;
}