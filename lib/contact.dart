import 'package:flutter/material.dart';

import 'custom_search.dart';

class Contact extends StatefulWidget{
  @override
  _ContactState createState()=> _ContactState();

}

class _ContactState extends State{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearch());
              },
              icon: const Icon(Icons.search))
        ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  color: Colors.lightBlueAccent,
                  margin: EdgeInsets.fromLTRB(15,60,15,30),
                  child: Column(children: <Widget>[
                    Image.asset("assets/developer.PNG"),
                    Container(margin: EdgeInsets.fromLTRB(15,30,15,30),
                    child: 
                    Center(
                      child: Column(
                        children: [
                          Text("Developer Name: ",style: TextStyle(fontSize: 18,color: Colors.white60,fontWeight: FontWeight.bold,fontFamily: 'Inter'),),
                          Text("H. Thiwanki Dias Hettiarachchi",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Inter'),),
                          SizedBox(height: 20,),
                    
                          Text("Developer Gmail: ",style: TextStyle(fontSize: 18,color: Colors.white60,fontWeight: FontWeight.bold,fontFamily: 'Inter'),),
                          Text("hthiwanki293@gmail.com",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Inter'),),
                          SizedBox(height: 20,),
                    
                          
                        ],
                      ),
                    ),)
                      
                      
                  ]),
                ),
              ),
            ],
          ),
        ),
    );
  }
  
  
  
}