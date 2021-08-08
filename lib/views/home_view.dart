import 'package:flutter/material.dart';
import 'package:weather_app/controllers/home_controller.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:get/get.dart';
import 'package:weather_app/utils/gradientContainer.dart';
import 'package:weather_app/views/cityEntry_view.dart';
import 'package:weather_app/views/dailySummary_view.dart';
import 'package:weather_app/views/lastUpdated_view.dart';
import 'package:weather_app/views/location_view.dart';
import 'package:weather_app/views/weatherDescription_view.dart';
import 'package:weather_app/views/weatherSummary_view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  Widget buildBusyIndicator() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)),
      SizedBox(
        height: 20,
      ),
      Text('Please Wait...',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ))
    ]);
  }

  Widget buildErrIndicator() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
        height: 20,
      ),
      Text('Oops Something went wrong!!',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ))
    ]);
  }

  GradientContainer _buildGradientContainer(
      WeatherCondition condition, bool isDayTime, Widget child) {
    GradientContainer container;

    // if night time then just default to a blue/grey
    if (isDayTime != null && !isDayTime)
      container = GradientContainer(color: Colors.blueGrey, child: child);
    else {
      switch (condition) {
        case WeatherCondition.clear:
        case WeatherCondition.lightCloud:
          container = GradientContainer(color: Colors.yellow, child: child);
          break;
        case WeatherCondition.fog:
        case WeatherCondition.atmosphere:
        case WeatherCondition.rain:
        case WeatherCondition.drizzle:
        case WeatherCondition.mist:
        case WeatherCondition.heavyCloud:
          container = GradientContainer(color: Colors.indigo, child: child);
          break;
        case WeatherCondition.snow:
          container = GradientContainer(color: Colors.lightBlue, child: child);
          break;
        case WeatherCondition.thunderstorm:
          container = GradientContainer(color: Colors.deepPurple, child: child);
          break;
        default:
          container = GradientContainer(color: Colors.lightBlue, child: child);
      }
    }

    return container;
  }

  Widget buildDailySummary(List<Weather> dailyForecast) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: dailyForecast
            .map((item) => new DailySummaryView(
                  weather: item,
                ))
            .toList());
  }

  Widget buildHomeView(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: RefreshIndicator(
        onRefresh: () => Get.find<HomeController>()
            .updateCity(Get.find<HomeController>().homeView.value.city!),
        child: ListView(
          children: [
            CityEntryView(
              city: Get.find<HomeController>().homeView.value.city!,
            ),
            Get.find<HomeController>().homeView.value.loading
                ? buildBusyIndicator()
                : Get.find<HomeController>().homeView.value.isErr
                    ? buildErrIndicator()
                    : Column(
                        children: [
                          LocationView(
                            city:
                                Get.find<HomeController>().homeView.value.city!,
                            latitude: Get.find<HomeController>()
                                .homeView
                                .value
                                .latitude!,
                            longitude: Get.find<HomeController>()
                                .homeView
                                .value
                                .longitude!,
                          ),
                          SizedBox(height: 50),
                          WeatherSummaryView(
                              condition: Get.find<HomeController>()
                                  .homeView
                                  .value
                                  .current!
                                  .condition,
                              temp: Get.find<HomeController>()
                                  .homeView
                                  .value
                                  .current!
                                  .temp,
                              feelsLike: Get.find<HomeController>()
                                  .homeView
                                  .value
                                  .current!
                                  .feelLikeTemp,
                              isdayTime: Get.find<HomeController>()
                                  .homeView
                                  .value
                                  .isDayTime!),
                          SizedBox(height: 20),
                          WeatherDescriptionView(
                              weatherDescription: Get.find<HomeController>()
                                  .homeView
                                  .value
                                  .current!
                                  .description),
                          SizedBox(height: 100),
                          buildDailySummary(Get.find<HomeController>()
                              .homeView
                              .value
                              .daily as List<Weather>),
                          LastUpdatedView(
                              lastUpdatedOn: Get.find<HomeController>()
                                  .homeView
                                  .value
                                  .lastUpdated!),
                        ],
                      )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
            () => Get.find<HomeController>().homeView.value.initialDataLoaded
                ? _buildGradientContainer(
                    Get.find<HomeController>()
                        .homeView
                        .value
                        .current!
                        .condition,
                    Get.find<HomeController>().homeView.value.isDayTime!,
                    buildHomeView(context),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Please Wait...',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ))
                      ],
                    ),
                  )),
      ),
    );
  }
}
