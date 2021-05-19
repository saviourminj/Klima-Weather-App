import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget getImage({int weatherDesc , double height , double width}) {
  String networkImage;
  if (weatherDesc >= 200 && weatherDesc < 300) {
    networkImage = 'http://openweathermap.org/img/wn/11d@2x.png';
  } else if (weatherDesc >= 300 && weatherDesc < 500) {
    networkImage = 'http://openweathermap.org/img/wn/09d@2x.png';
  } else if (weatherDesc >= 500 && weatherDesc < 600) {
    networkImage = 'http://openweathermap.org/img/wn/10d@2x.png';
  } else if (weatherDesc >= 600 && weatherDesc < 700) {
    networkImage = 'http://openweathermap.org/img/wn/13d@2x.png';
  } else if (weatherDesc >= 700 && weatherDesc < 800) {
    networkImage = 'http://openweathermap.org/img/wn/50d@2x.png';
  } else if (weatherDesc == 800) {
    networkImage = 'http://openweathermap.org/img/wn/01d@2x.png';
  } else if (weatherDesc == 801) {
    networkImage = 'http://openweathermap.org/img/wn/02d@2x.png';
  } else if (weatherDesc == 802) {
    networkImage = 'http://openweathermap.org/img/wn/03d@2x.png';
  } else if (weatherDesc == 803) {
    networkImage = 'http://openweathermap.org/img/wn/04d@2x.png';
  } else if (weatherDesc == 804) {
    networkImage = 'http://openweathermap.org/img/wn/04d@2x.png';
  }

  return Image.network(
    networkImage,
    fit: BoxFit.fill,
    height: height,
    width: width,
  );
}
