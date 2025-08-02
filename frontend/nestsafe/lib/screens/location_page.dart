import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  void initState() {
    super.initState();
    fetchAndSendLocation();
  }

  Future<void> fetchAndSendLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Step 1: Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled
      return;
    }

    // Step 2: Ask for permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are permanently denied
      return;
    }

    // Step 3: Get current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    double latitude = position.latitude;
    double longitude = position.longitude;

    // Step 4: Send to backend
    var url = Uri.parse('https://your-api-endpoint.com/location'); // 👈 Change this
    await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: '{"latitude": $latitude, "longitude": $longitude}',
    );

    // Step 5: Redirect to Register screen
    Navigator.pushReplacementNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()), // Loading screen
    );
  }
}
