import 'package:ember_trip_view/locator.dart';
import 'package:ember_trip_view/pages/trip_view_page.dart';
import 'package:flutter/material.dart';

void main() {
  Locator.registerDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const TripViewPage(),
  );
}
