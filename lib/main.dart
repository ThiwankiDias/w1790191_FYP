// Developer name - ( H. Thiwanki Dias Hettiarachchi, UoW id - w1790191) 
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