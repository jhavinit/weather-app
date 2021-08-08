import 'package:weather_app/models/weather_model.dart';

class HomeView {
  bool initialDataLoaded;
  bool loading;
  bool isErr;
  DateTime? lastUpdated;
  double? longitude;
  double? latitude;
  List<dynamic> daily;
  Weather? current;
  bool? isDayTime;
  String? city;

  HomeView(
      {this.initialDataLoaded = false,
      this.loading = true,
      this.isErr = false,
      this.lastUpdated,
      this.longitude,
      this.latitude,
      this.daily: const [],
      this.current,
      this.city,
      this.isDayTime});
}
