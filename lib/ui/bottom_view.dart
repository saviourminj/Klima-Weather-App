import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klima_weather/model/weatherForecastModel.dart';
import 'package:klima_weather/ui/7dayForecast.dart';

Widget bottomView(
    AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
  var forecast = snapshot.data.list;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Text('7 Day Weather Forecast'.toUpperCase()),
      Container(
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 10),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context,index) => SizedBox(width: 8),
            itemCount: forecast.length,
            itemBuilder: (context,index) => ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [
                        Colors.blueGrey.shade100,Colors.lightBlue.shade200,Colors.lightBlue.shade400,Colors.blue.shade600
                      ],
                  ),
                ),
                height: 160,
                width: MediaQuery.of(context).size.width/2.1,
                child: forecastCard(snapshot,index),
              ),
            ),
          ),)
    ],
  );
}
