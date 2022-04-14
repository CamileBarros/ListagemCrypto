import 'package:flutter/material.dart';
import 'home_controller.dart';
import 'home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeController(child: HomeScreen()),
    );
  }
}
