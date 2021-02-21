import 'dart:convert';

import 'package:clima_app/services/location.dart';
import 'package:clima_app/services/networking.dart';
import 'package:clima_app/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  void getLocation() async {
    var decodedData = await WeatherModel().getLocation();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LocationScreen(decodedData)));
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("The screen is closed");
  }

  void getData() async {
    Response response = await get(
        "http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.grey,
        ),
      ),
    );
  }
}
