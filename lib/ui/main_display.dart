import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:klima_weather/constants/constants.dart';
import 'package:klima_weather/model/weatherForecastModel.dart';
import 'package:klima_weather/network/network.dart';
import 'package:klima_weather/ui/bottom_view.dart';
import 'package:klima_weather/ui/mid_display.dart';

// ignore: must_be_immutable
class Display extends StatefulWidget {
  Future<WeatherForecastModel> forecastObject;
  String cityNameField;
  Display({this.forecastObject , this.cityNameField});
  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: kCityNameTextFieldDecoration,
              onSubmitted: (value) {
                setState(() {
                  widget.cityNameField = value ;
                  widget.forecastObject = getCityWeather(
                      cityNameFromField: widget.cityNameField);
                  print(widget.cityNameField);
                });
              },
            ),
            Container(
              child: FutureBuilder<WeatherForecastModel>(future: widget.forecastObject,
                  //snapshot parameter gives data when future resolves so when we get forecastObject it is present in snapshot
                  builder: (BuildContext context , AsyncSnapshot snapshot){
                    if(snapshot.hasData){
                      return Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: <Widget>[
                            midDisplay(snapshot),
                            SizedBox(height: 5,),
                            bottomView(snapshot, context),
                          ],
                        ),  //we pass the snapshot to the next screen as a parameter
                      );
                    }
                    else return Container(
                      child: SpinKitWanderingCubes(
                        shape: BoxShape.circle,
                        color: Colors.yellow,
                        duration: Duration(seconds: 3),
                        size: 50,
                      ),
                    );
                  }),
            ),



          ],
        ),
      ),
    );
  }


}