import 'dart:developer';

import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late Location location;
  @override
  void initState() {
    super.initState();
    location = Location();
  }

  void getLocation() async {
    await location.getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getLocation();
            if (location.longitude != null) {
              log("longitude: ${location.longitude}\n latitude: ${location.latitude}");
            }
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
