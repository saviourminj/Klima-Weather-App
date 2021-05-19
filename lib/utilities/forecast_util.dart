import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:klima_weather/model/weatherForecastModel.dart';

class Util {
  static String appID = '1b3094a00cbd299797045814fa9d9edf';

  static String getFormattedDate(DateTime dateTime) {
    return new DateFormat('EEEE, MMM d, y').format(dateTime);
  }

  static String getFormattedTime(DateTime dateTime) {
    return new DateFormat.jm().format(dateTime);
  }
}
