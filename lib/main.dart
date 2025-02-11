import 'package:flutter/material.dart';
import 'package:warals/screens/login1_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Warals App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login1Screen(), // Start with the first screen
    );
  }
}
