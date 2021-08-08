import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_model.dart';

class DailySummaryView extends StatelessWidget {
  final Weather weather;

  DailySummaryView({Key? key, required this.weather})
      : assert(weather != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final dayOfWeek =
        toBeginningOfSentenceCase(DateFormat('EEE').format(this.weather.date));

    return Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text(dayOfWeek ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w300)),
              Text("${_formatTemperature(this.weather.temp)}°",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500)),
            ]),
            Padding(
                padding: EdgeInsets.only(left: 5),
                child: Container(
                    alignment: Alignment.center,
                    child: _mapWeatherConditionToImage(this.weather.condition)))
          ],
        ));
  }

  String _formatTemperature(double t) {
    var tempC = t - 273.15;
    return tempC.round().toString();
  }

  Widget _mapWeatherConditionToImage(WeatherCondition condition) {
    IconData icon;
    switch (condition) {
      case WeatherCondition.thunderstorm:
        icon = Icons.bolt;
        break;
      case WeatherCondition.heavyCloud:
        icon = Icons.cloud;
        break;
      case WeatherCondition.lightCloud:
        icon = Icons.wb_cloudy_outlined;
        break;
      case WeatherCondition.drizzle:
      case WeatherCondition.mist:
        icon = Icons.cloud_circle_outlined;
        break;
      case WeatherCondition.clear:
        icon = Icons.wb_cloudy_outlined;
        break;
      case WeatherCondition.fog:
        icon = Icons.wb_incandescent_outlined;
        break;
      case WeatherCondition.snow:
        icon = Icons.snowboarding;
        break;
      case WeatherCondition.rain:
        icon = Icons.stream;
        break;
      case WeatherCondition.atmosphere:
        icon = Icons.workspaces_outline;
        break;

      default:
        icon = Icons.wb_sunny;
    }

    return Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Icon(
          icon,
          size: 20,
          color: Colors.white,
        ));
  }
}
