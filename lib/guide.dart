// Developer name - ( H. Thiwanki Dias Hettiarachchi, UoW id - w1790191) 
// Guidence page of the application 

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
                    margin: EdgeInsets.fromLTRB(10, 2, 10, 0),
                    child: const Text(
                      "In the Home screen, click the “SELECT IMAGE” button and chooses or capture your vehicle tyre Image by clicking the Gallery or Camera button. ",
                      style: TextStyle(fontSize: 15, fontFamily: 'Inter'),
                    )),
                Container(
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                  margin: EdgeInsets.fromLTRB(10, 2, 10, 0),
                  child: Image(image: AssetImage("assets/step_01.jpg"),width: 300,),),
                  Container(
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: Image(image: AssetImage("assets/step_01-01.jpg"),width: 300,),),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
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
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: Image(image: AssetImage("assets/step_02.jpg"),width: 300,),),
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
                        "Then you can see the predicted results output images for detected defects and the risk of each defects below to the 'DETECT' button.",
                        style: TextStyle(fontSize: 15, fontFamily: 'Inter'),
                      ),
                    )),
                    Container(
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: Image(image: AssetImage("assets/defects_result.jpg"),width: 300,),),

                  Container(
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: Image(image: AssetImage("assets/risks_result.jpg"),width: 300,),),
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
                        "Then you can see the risk of defective tyre as a text.",
                        style: TextStyle(fontSize: 15, fontFamily: 'Inter'),
                      ),
                    )),
                     Container(
                      decoration: BoxDecoration(border: Border.all(width: 1)),
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: Image(image: AssetImage("assets/overall_risks_result.JPG"),width: 300,),),
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
                    "How to zoom out/ zoom in the predicted image results.",
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
                      "If the clssified defects names are too small to see clearly, we can zoom out or zoom in around the image easily by pinching our two fingers inwards and outwards on the image."
                      ,style: TextStyle(fontFamily: "Inter" ),
                      ),
                ),
              ),
              Center(
                child: Row(children: <Widget>[
                  Container(
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                    margin: EdgeInsets.fromLTRB(10, 5, 5, 0),
                    child: Image(image: AssetImage("assets/zoom_out.JPG"),width: 150,),),
                    Container(
                    decoration: BoxDecoration(border: Border.all(width: 2)),
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: Image(image: AssetImage("assets/zoom_in.JPG"),width: 150,),),
                ],
                ),
              )
            ]),
          ),
          Container(
            color: Color(0xFF75B2EB),
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(5),
            child: Column(children:   <Widget>[
              Center(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "Types of tyre defects",
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
                margin: EdgeInsets.fromLTRB(10, 2, 10, 0),
                child: Text(
                    "This app can identify 10 types of tyre defects. The names of those defects can be found below."),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(10, 15, 0, 10),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Crack , Sidewall Bubble , Center Wear , Saw Tooth Wear , Flat Spot Wear , Cut , Shoulder Wear , Puncture by Foreign Object , Tread Separation , Exposed Wire Cords ",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Inter',
                          color: Colors.white),
                    ),
                  )),
            ],),
          ),

          Container(
            color: Color(0xFF75B2EB),
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(5),
            child: Column(children: <Widget>[
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "Validity of the predicted risks of tyres",
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
                      "Detected defective tyre’s risk is only valid for when you are driving with these below conditions."),
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(10, 15, 10, 10),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Tyres should not be flattened yet",
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
                      "Definitions of predicted risks",
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
                        "High Risk",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter'),
                      )),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                    child: const Text(
                      "If you drive the vehicle with that defective tyre/ tyres, chances of bad effect are high.",
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
                        "If You drive the vehicle with that defective tyre/ tyres, bad effects can happen or may not happen. ",
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
                        "If you drive with those defected tyre/ tyres, there is a very low chance of a bad effect.",
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
