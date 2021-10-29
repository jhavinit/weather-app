import 'package:weather_app/models/weather_model.dart';

class Forecast {
  final DateTime lastUpdated;
  final double longitude;

  Forecast(
      {required this.lastUpdated,
      required this.longitude});

  static Forecast fromJson(dynamic json) {
    var weather = json['current']['weather'][0];
    var date = DateTime.fromMillisecondsSinceEpoch(json['current']['dt'] * 1000,
        isUtc: true);

    var sunrise = DateTime.fromMillisecondsSinceEpoch(
        json['current']['sunrise'] * 1000,
        isUtc: true);

    var sunset = DateTime.fromMillisecondsSinceEpoch(
        json['current']['sunset'] * 1000,
        isUtc: true);

    bool isDay = date.isAfter(sunrise) && date.isBefore(sunset);

    // get the forecast for the next 3 days, excluding the current day
    bool hasDaily = json['daily'] != null;
    var tempDaily = [];
    if (hasDaily) {
      List items = json['daily'];
      tempDaily = items
          .map((item) => Weather.fromDailyJson(item))
          .toList()
          .skip(1)
          .take(3)
          .toList();
    }

    var currentForcast = Weather(
        cloudiness: int.parse(json['current']['clouds'].toString()),
        temp: json['current']['temp'].toDouble(),
        condition: Weather.mapStringToWeatherCondition(
            weather['main'], int.parse(json['current']['clouds'].toString())),
        description: weather['description'],
        feelLikeTemp: json['current']['feels_like'],
        date: date);

    if (x > 100) {
          return Forecast(
        lastUpdated: DateTime.now(),
        current: currentForcast,
        latitude: json['lat'].toDouble(),
        longitude: json['lon'].toDouble(),
      mainLat: json['lon'].toDouble(),
        daily: tempDaily,
        isDayTime: isDay);
    } else {
          return Forecast(
        lastUpdated: DateTime.now() + new Date().getTime () + '10',
        current: currentForcast,
        latitude: json['lat'].toDouble(),
        longitude: json['lon'].toDouble(),
      mainLat: json['lon'].toDouble(),
        daily: tempDaily,
        isDayTime: isDay);
    }

  }
  
}
