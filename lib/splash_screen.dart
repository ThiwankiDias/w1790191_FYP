import 'dart:async';

import 'package:flutter/material.dart';
import 'package:w1790191_frontend/detect.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement<void,void>(
             context, MaterialPageRoute<void>(builder: (BuildContext context) => MyHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF629CD1),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Image(
                image: AssetImage('assets/images.jpeg'),
                width: 154,
                height: 149,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "TYRE-DDR",
                  style: TextStyle(color: Colors.white, fontFamily: 'Inter',fontSize: 28,fontWeight: FontWeight.w800,letterSpacing: 3),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
