import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/home_controller.dart';

class CityEntryView extends StatelessWidget {
  TextEditingController cityEditController = new TextEditingController();
  String city;

  CityEntryView({
    Key? key,
    required this.city,
  }) : super(key: key);

  void updateCity(String newCity) {
    Get.find<HomeController>().updateCity(newCity);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 50),
        padding: EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 00),
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(3),
              topRight: Radius.circular(3),
              bottomLeft: Radius.circular(3),
              bottomRight: Radius.circular(3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: new Icon(Icons.search),
              onPressed: () {
                this.updateCity(cityEditController.text);
                // model.refreshWeather(cityEditController.text, context);
              },
            ),
            SizedBox(width: 10),
            Expanded(
                child: TextField(
                    controller: cityEditController,
                    decoration:
                        InputDecoration.collapsed(hintText: "Enter City"),
                    onSubmitted: (String city) => {
                          // model.refreshWeather(city, context)
                        })),
          ],
        ));
  }
}
