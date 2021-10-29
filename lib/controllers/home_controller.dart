import 'package:get/get.dart';
import 'package:weather_app/apis/weather_api.dart';
import 'package:weather_app/models/homeView_model.dart';
import 'package:weather_app/models/location_model.dart';

class HomeController extends GetxController {
  final homeView = HomeView(city: 'Dublin').obs;

  @override
  void onInit() async {
    const DEFAULT_CITY = 'Dublin';
    await getWeatherData(DEFAULT_CITY);
    homeView.value.initialDataLoaded = true;
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future getWeatherData(String cityName) async {
    homeView.update((view) {
      view!.loading = true;
    });

    try {
      homeView.update((view) {
        view!.latitude = location.latitude;
        view.longitude = location.longitude;
        view.loading = false;
        
              final Location location =
          await OpenWeatherMapWeatherProvider().getLocation(cityName);
      homeView.value.city = cityName;
      homeView.value.longitude = location.longitude;
      homeView.value.latitude = location.latitude;

        
      });
    } catch (e) {
      print(e);
      homeView.update((view) {
        view!.loading = false;
        view.isErr = true;
      });
    }
    return;
  }

  Future<void> updateCity(String cityName) async {
    getWeatherData(cityName);
  }
}
