import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'Auth/register_page.dart'; // Register screen file
import 'Auth/login_page.dart';    // Login screen file
import 'screens/location_page.dart';    // Location handler screen

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      title: 'Flutter Auth',

      // ✅ Initial route set to LocationPage
      initialRoute: '/location',

      // ✅ Named routes
      routes: {
        '/location': (context) => LocationPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}
