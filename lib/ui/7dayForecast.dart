import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klima_weather/model/weatherForecastModel.dart';
import 'package:klima_weather/utilities/forecast_util.dart';
import 'package:klima_weather/utilities/image_getter.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forecastList = snapshot.data.list;
  var dayOfWeek = "";
  DateTime date =
      new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt*1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(",")[0]; //[Saturday, April 12 , 2021]

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(dayOfWeek),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getImage(
              weatherDesc: forecastList[index].weather[0].id.toInt(),
              width: 70,
              height: 70,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text('${forecastList[index].main.tempMax.toStringAsFixed(1)}°'),
                    ),
                    Icon(FontAwesomeIcons.arrowUp,
                    color: Colors.teal.shade900,
                    size: 17,),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text('${forecastList[index].main.tempMin.toStringAsFixed(1)}°'),
                    ),
                    Icon(FontAwesomeIcons.arrowDown,
                      color: Colors.teal.shade900,
                    size: 17,),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:5.0),
                  child: Row(
                    children: <Widget>[
                      Text('${forecastList[index].wind.speed.toStringAsFixed(1)}  '),
                      Icon(FontAwesomeIcons.wind,
                        color: Colors.teal.shade900,
                      size: 17,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:5.0),
                  child: Row(
                    children: <Widget>[
                      Text('${forecastList[index].main.humidity.toStringAsFixed(1)}% '),
                      Icon(FontAwesomeIcons.water,
                        color: Colors.teal.shade900,
                      size: 17,),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      )
    ],
  );
}
