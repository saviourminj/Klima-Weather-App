import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getIcons({int weatherCode,Color iconColor}) {
  Icon returnedIcon;
  if (weatherCode >= 200 && weatherCode < 300) {
    returnedIcon =  Icon(FontAwesomeIcons.cloudRain,
        color: iconColor,
        size: 170,
    );
  } else if (weatherCode >= 300 && weatherCode < 500) {
    returnedIcon=  Icon(FontAwesomeIcons.cloudRain,
        color: iconColor,
        size:  170,
    );
  } else if (weatherCode >= 500 && weatherCode < 600) {
    returnedIcon=  Icon(FontAwesomeIcons.cloudSunRain,
        color: iconColor,
        size: 170,
    );
  } else if (weatherCode >= 700 && weatherCode < 800) {
    returnedIcon =  Icon(FontAwesomeIcons.snowflake,
        color: iconColor,
        size: 170,
    );
  } else if (weatherCode == 800) {
    returnedIcon=  Icon(FontAwesomeIcons.rainbow,
        color: iconColor,
        size: 170,
    );
  }

  return returnedIcon;
}