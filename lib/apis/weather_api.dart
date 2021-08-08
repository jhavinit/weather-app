// import 'dart:convert';
import 'package:get/get.dart';
import 'package:weather_app/models/forecast_model.dart';
import 'package:weather_app/models/location_model.dart';

class OpenWeatherMapWeatherProvider extends GetConnect {
  static const endPointUrl = 'https://api.openweathermap.org/data/2.5';
  static const apiKey = "apikey";

  Future<Location> getLocation(String? city) async {
    final requestUrl = '$endPointUrl/weather?q=$city&APPID=$apiKey';
    final response = await get(Uri.encodeFull(requestUrl));
    if (response.statusCode != 200) {
      throw Exception(
          'error retrieving location for city $city: ${response.statusCode}');
    }
    return Location.fromJson(response.body);
  }

  Future<Forecast> getWeather(Location location) async {
    final requestUrl =
        '$endPointUrl/onecall?lat=${location.latitude}&lon=${location.longitude}&exclude=hourly,minutely&APPID=$apiKey';
    final response = await get(Uri.encodeFull(requestUrl));

    if (response.statusCode != 200) {
      throw Exception('error retrieving weather: ${response.statusCode}');
    }

    return Forecast.fromJson(response.body);

    // return Forecast.fromJson({
    //   "lat": 51.9,
    //   "lon": -8.47,
    //   "timezone": "Europe/Dublin",
    //   "timezone_offset": 3600,
    //   "current": {
    //     "dt": 1598893031,
    //     "sunrise": 1598852699,
    //     "sunset": 1598901819,
    //     "temp": 288.67,
    //     "feels_like": 285.44,
    //     "pressure": 1017,
    //     "humidity": 82,
    //     "dew_point": 285.61,
    //     "uvi": 4.68,
    //     "clouds": 75,
    //     "visibility": 10000,
    //     "wind_speed": 5.7,
    //     "wind_deg": 180,
    //     "weather": [
    //       {
    //         "id": 803,
    //         "main": "Clouds",
    //         "description": "broken clouds",
    //         "icon": "04d"
    //       }
    //     ]
    //   },
    //   "daily": [
    //     {
    //       "dt": 1598875200,
    //       "sunrise": 1598852699,
    //       "sunset": 1598901819,
    //       "temp": {
    //         "day": 288.67,
    //         "min": 286.54,
    //         "max": 288.67,
    //         "night": 287.19,
    //         "eve": 288.32,
    //         "morn": 288.67
    //       },
    //       "feels_like": {
    //         "day": 285.39,
    //         "night": 284.85,
    //         "eve": 285.91,
    //         "morn": 285.39
    //       },
    //       "pressure": 1017,
    //       "humidity": 82,
    //       "dew_point": 285.61,
    //       "wind_speed": 5.78,
    //       "wind_deg": 187,
    //       "weather": [
    //         {
    //           "id": 500,
    //           "main": "Rain",
    //           "description": "light rain",
    //           "icon": "10d"
    //         }
    //       ],
    //       "clouds": 75,
    //       "pop": 0.32,
    //       "rain": 0.29,
    //       "uvi": 4.68
    //     },
    //     {
    //       "dt": 1598961600,
    //       "sunrise": 1598939196,
    //       "sunset": 1598988084,
    //       "temp": {
    //         "day": 290.35,
    //         "min": 285.69,
    //         "max": 290.59,
    //         "night": 285.96,
    //         "eve": 288.09,
    //         "morn": 287.19
    //       },
    //       "feels_like": {
    //         "day": 287.38,
    //         "night": 283.88,
    //         "eve": 285.46,
    //         "morn": 284.76
    //       },
    //       "pressure": 1018,
    //       "humidity": 83,
    //       "dew_point": 287.56,
    //       "wind_speed": 6.19,
    //       "wind_deg": 168,
    //       "weather": [
    //         {
    //           "id": 500,
    //           "main": "Rain",
    //           "description": "light rain",
    //           "icon": "10d"
    //         }
    //       ],
    //       "clouds": 88,
    //       "pop": 0.46,
    //       "rain": 0.73,
    //       "uvi": 4.8
    //     },
    //     {
    //       "dt": 1598961600,
    //       "sunrise": 1598939196,
    //       "sunset": 1598988084,
    //       "temp": {
    //         "day": 290.35,
    //         "min": 285.69,
    //         "max": 290.59,
    //         "night": 285.96,
    //         "eve": 288.09,
    //         "morn": 287.19
    //       },
    //       "feels_like": {
    //         "day": 287.38,
    //         "night": 283.88,
    //         "eve": 285.46,
    //         "morn": 284.76
    //       },
    //       "pressure": 1018,
    //       "humidity": 83,
    //       "dew_point": 287.56,
    //       "wind_speed": 6.19,
    //       "wind_deg": 168,
    //       "weather": [
    //         {
    //           "id": 500,
    //           "main": "Rain",
    //           "description": "light rain",
    //           "icon": "10d"
    //         }
    //       ],
    //       "clouds": 88,
    //       "pop": 0.46,
    //       "rain": 0.73,
    //       "uvi": 4.8
    //     },
    //     {
    //       "dt": 1598961600,
    //       "sunrise": 1598939196,
    //       "sunset": 1598988084,
    //       "temp": {
    //         "day": 290.35,
    //         "min": 285.69,
    //         "max": 290.59,
    //         "night": 285.96,
    //         "eve": 288.09,
    //         "morn": 287.19
    //       },
    //       "feels_like": {
    //         "day": 287.38,
    //         "night": 283.88,
    //         "eve": 285.46,
    //         "morn": 284.76
    //       },
    //       "pressure": 1018,
    //       "humidity": 83,
    //       "dew_point": 287.56,
    //       "wind_speed": 6.19,
    //       "wind_deg": 168,
    //       "weather": [
    //         {
    //           "id": 500,
    //           "main": "Rain",
    //           "description": "light rain",
    //           "icon": "10d"
    //         }
    //       ],
    //       "clouds": 88,
    //       "pop": 0.46,
    //       "rain": 0.73,
    //       "uvi": 4.8
    //     }
    //   ]
    // });
  }
}
