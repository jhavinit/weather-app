import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherSummaryView extends StatelessWidget {
  final WeatherCondition condition;
  final double temp;
  final double feelsLike;
  final bool isdayTime;

  WeatherSummaryView(
      {Key? key,
      required this.condition,
      required this.temp,
      required this.feelsLike,
      required this.isdayTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(
          children: [
            Text(
              '${_formatTemperature(this.temp)}°ᶜ',
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              'Feels like ${_formatTemperature(this.feelsLike)}°ᶜ',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        _mapWeatherConditionToImage(this.condition, this.isdayTime),
      ]),
    );
  }

  String _formatTemperature(double t) {
    var tempC = t - 273.15;
    return tempC.round().toString();
  }

  Widget _mapWeatherConditionToImage(
      WeatherCondition condition, bool isDayTime) {
    IconData icon;
    switch (condition) {
      case WeatherCondition.thunderstorm:
        icon = Icons.bolt;
        break;
      case WeatherCondition.heavyCloud:
        icon = Icons.cloud;
        break;
      case WeatherCondition.lightCloud:
        isDayTime
            ? icon = Icons.wb_cloudy_outlined
            : icon = Icons.star_outlined;
        break;
      case WeatherCondition.drizzle:
      case WeatherCondition.mist:
        icon = Icons.cloud_circle_outlined;
        break;
      case WeatherCondition.clear:
        isDayTime ? icon = Icons.wb_sunny : icon = Icons.star_outlined;
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
          size: 120,
          color: Colors.white,
        ));
  }
}
