import 'package:flutter/material.dart';
import 'package:weather_app/utils/stringCapitalize.dart';

class WeatherDescriptionView extends StatelessWidget {
  final String weatherDescription;

  WeatherDescriptionView({Key? key, required this.weatherDescription})
      : assert(weatherDescription != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(weatherDescription.capitalize(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          )),
    );
  }
}
