import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF629CD1),
      body: Column(
        children: [
          Container(
            color: Color(0xFF75B2EB),
            margin: EdgeInsets.fromLTRB(15,25,15,20),
            padding: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                      child: const Text(
                        "Note: ",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                      child: const Text(
                          "Detected defective tyre’s risk is only valid for when you are driving with these below conditions",
                          style: TextStyle(
                              fontFamily: 'Inter',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14))),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      margin: EdgeInsets.fromLTRB(11, 2, 10, 10),
                      child: const Text("""· Tyres should not be flattened yet.
· Weather should be clear
· Road should be dry and flat
· Drive in usual driving style 
                          """,
                          style: TextStyle(
                              fontFamily: 'Inter',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
