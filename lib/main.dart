import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/bindings/home_binding.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weather app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
          binding: HomePageBinding(),
        ),
      ],
    );
  }
}
