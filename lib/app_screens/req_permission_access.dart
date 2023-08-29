import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationPermissionScreen extends StatefulWidget {
  @override
  _LocationPermissionScreenState createState() => _LocationPermissionScreenState();
}

class _LocationPermissionScreenState extends State<LocationPermissionScreen> {
  Future<void> _requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Handle denied permission
      } else if (permission == LocationPermission.deniedForever) {
        // Handle permanently denied permission
      } else {
        // Permission granted
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Permission'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _requestLocationPermission,
          child: Text('Request Location Permission'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LocationPermissionScreen(),
  ));
}
