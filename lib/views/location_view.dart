import 'package:flutter/material.dart';

class LocationView extends StatelessWidget {
  final String city;
  final double longitude;
  final double latitude;

  LocationView({
    Key? key,
    required this.city,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Text((this.city.toUpperCase()),
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on, color: Colors.white, size: 15),
            SizedBox(width: 10),
            Text(this.latitude.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
            Text(' , ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
            Text(this.longitude.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
          ],
        )
      ]),
    );
  }
}
