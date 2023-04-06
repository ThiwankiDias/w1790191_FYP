import 'package:flutter/material.dart';
import 'package:w1790191_frontend/detect.dart';

import 'custom_search.dart';

class Guide extends StatefulWidget {
  @override
  _GuideState createState() => _GuideState();
}

class _GuideState extends State<Guide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GUIDANCE"),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearch());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      backgroundColor: const Color(0xFF629CD1),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          
          Container(
              color: Color(0xFF75B2EB),
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(5),
              child: Column(children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text(
                      "How to Use the application",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
                  child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "First step",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter'),
                      )),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                    child: const Text(
                      "In the Home screen, click the “SELECT IMAGE” button and chooses or capture your vehicle tyre Image. ",
                      style: TextStyle(fontSize: 15, fontFamily: 'Inter'),
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 2, 10, 0),
                  child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Second step",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter'),
                      )),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "After that then click the “DETECT” button.",
                        style: TextStyle(fontSize: 15, fontFamily: 'Inter'),
                      ),
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 2, 10, 0),
                  child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Third step",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter'),
                      )),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Then in the next pop up screen you should read the note.",
                        style: TextStyle(fontSize: 15, fontFamily: 'Inter'),
                      ),
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 2, 10, 0),
                  child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Fourth step",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter'),
                      )),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Then you can see the predicted results out put images for detected defects and the risk of each defects. ",
                        style: TextStyle(fontSize: 15, fontFamily: 'Inter'),
                      ),
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 2, 10, 0),
                  child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Fifth step",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter'),
                      )),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Then you can see the risk of defective tyre as a text.",
                        style: TextStyle(fontSize: 15, fontFamily: 'Inter'),
                      ),
                    )),
              ])),
          Container(
            color: Color(0xFF75B2EB),
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(5),
            child: Column(children: <Widget>[
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "Validity of the predicted Risks of tyres",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 2, 10, 0),
                  child: Text(
                      "Detected defective tyre’s risk is only valid for when you are driving with these below conditions"),
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(10, 15, 10, 10),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Tyres should not be flattened yet.",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Inter',
                          color: Colors.white),
                    ),
                  )),
              Container(
                  margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Weather should be clear",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Inter',
                          color: Colors.white),
                    ),
                  )),
              Container(
                  margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Road should be dry and flat",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Inter',
                          color: Colors.white),
                    ),
                  )),
              Container(
                  margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Drive in usual driving style (not in sportify diving style)",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Inter',
                          color: Colors.white),
                    ),
                  )),
            ]),
          ),
          Container(
            color: Color(0xFF75B2EB),
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Definitions of Predicted Risks",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
                  child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "High risk",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter'),
                      )),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                    child: const Text(
                      "If you drive the vehicle with that defective tyre/ tyres, chances of bad effect are high ",
                      style: TextStyle(fontSize: 15, fontFamily: 'Inter'),
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 2, 10, 0),
                  child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Medium Risk",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter'),
                      )),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "If You drive the vehicle with that defective tyre/ tyres, bad effects can happen or may not happen ",
                        style: TextStyle(fontSize: 15, fontFamily: 'Inter'),
                      ),
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 2, 10, 0),
                  child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Low Risk",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter'),
                      )),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "If you drive with those defected tyre/ tyres, there is a very low chance of a bad effect",
                        style: TextStyle(fontSize: 15, fontFamily: 'Inter'),
                      ),
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 2, 10, 0),
                  child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "No Risk",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter'),
                      )),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "There is no any risk from tyre defects to drive your vehicle.",
                        style: TextStyle(fontSize: 15, fontFamily: 'Inter'),
                      ),
                    )),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
