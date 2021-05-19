import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klima_weather/model/weatherForecastModel.dart';
import 'package:klima_weather/utilities/forecast_util.dart';
import 'package:klima_weather/utilities/image_getter.dart';

Widget midDisplay(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data.list;
  var cityName = snapshot.data.city.name;
  var countryName = snapshot.data.city.country;
  var date = snapshot.data.list[0].dtTxt;
  var time = snapshot.data.list[0].dt;
  var forecast=  forecastList[0];
  var formattedDateTime =  new DateTime.fromMillisecondsSinceEpoch(time*1000); //fromMillisecondsSinceEpoch(time*1000)
  var formattedTime = new DateTime.now();
  

  Container midView = Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          height: 3,
        ),
        Text(
          '$cityName , $countryName',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          '${Util.getFormattedDate(formattedDateTime)}',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          '${Util.getFormattedTime(formattedTime)}',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.lightBlueAccent.shade100,
              gradient: RadialGradient(colors: [
                Colors.lightBlueAccent.shade100,
                Colors.lightBlueAccent.shade200,
                Colors.lightBlueAccent.shade100,
                Colors.lightBlueAccent.shade200,
                Colors.lightBlueAccent.shade100,
                Colors.lightBlueAccent.shade200,
              ]),
              borderRadius: BorderRadius.circular(20)),
          child: getImage(
            weatherDesc: forecast.weather[0].id.toInt(),
            height: 210.0,
            width: 210.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10,bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                '${forecast.main.temp}°',
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                '${forecast.weather[0].description.toUpperCase()}',
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(colors: [
              Colors.lightBlue.shade400,Colors.lightBlueAccent.shade100
            ],)
          ),
          padding: EdgeInsets.all(15),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                 children: <Widget>[
                   Text('${forecast.main.tempMax.toStringAsFixed(1)}'),
                   SizedBox(height: 5,),
                   Icon(FontAwesomeIcons.temperatureHigh,color: Colors.brown),
                 ],
              ),
              SizedBox(width: 15,),
              Column(
                children: <Widget>[
                  Text('${forecast.main.tempMin.toStringAsFixed(1)}'),
                  SizedBox(height: 5,),
                  Icon(FontAwesomeIcons.temperatureLow,color: Colors.brown,)
                ],
              ),
              SizedBox(width: 15,),
              Column(
                children: <Widget>[
                  Text('${forecast.wind.speed.toStringAsFixed(1)} mi/h'),
                  SizedBox(height: 5,),
                  Icon(FontAwesomeIcons.wind,color: Colors.brown,),
                ],
              ),
              SizedBox(width: 15,),
              Column(
                children: <Widget>[
                  Text('${forecast.main.humidity.toStringAsFixed(1)}%'),
                  SizedBox(height: 5,),
                  Icon(FontAwesomeIcons.water,color: Colors.brown,),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
  return midView;
}
