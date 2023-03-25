import 'package:flutter/material.dart';
import 'package:w1790191_frontend/home.dart';

class Guide extends StatefulWidget {
  @override
  _GuideState createState() => _GuideState();
}

class _GuideState extends State<Guide> {
  @override
  Widget build(Object context) {
    return Scaffold(
      backgroundColor: const Color(0xFF629CD1),
      body: SingleChildScrollView( 
        child: Column(children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(15, 20, 0, 5),
            child: Align(
              alignment: Alignment.topLeft,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(this.context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
                child: const Icon(Icons.arrow_back),
              ),
            ),
          ),
          Container(
              color: Color(0xFF75B2EB),
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(5),
              child: Column(children: [
                const Center(
                  child: Text(
                    "GUIDANCE",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold),
                  ),
                ),
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
                      child: Text("After that then click the “DETECT” button.",
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
                Container(
                  margin: EdgeInsets.fromLTRB(10, 2, 10, 0),
                  child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Sixth step",
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
                        "Then you can see the definitions of risks for defective tyres tyre",
                        style: TextStyle(fontSize: 15, fontFamily: 'Inter'),
                      ),
                    )),
          
          
          
          
          
          
          
          
              ]))
        ]),
      ),
    );
  }
}
