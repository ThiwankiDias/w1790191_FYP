// sdk: ">=2.7.0 <3.0.0"
//flutter version 2.0.5 
import 'package:flutter/material.dart';
import 'package:w1790191_frontend/splash_screen.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
      home: SplashScreen(),
    );
  }
}