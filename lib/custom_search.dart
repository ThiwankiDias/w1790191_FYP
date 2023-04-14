import 'package:flutter/material.dart';
import 'package:w1790191_frontend/guide.dart';
import 'package:w1790191_frontend/no_search.dart';

import 'contact.dart';
import 'detect.dart';

class CustomSearch extends SearchDelegate {
 List<String> alldata = [
    "Guidance",
    "Detection Page",
    "Contacts",
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
     return Container();
  }
  @override
  void showResults(BuildContext context){
    if(query == alldata[0]){
      navigateToGuidePage(context);
    }
    else if(query == alldata[1]){
      navigateToDetectionPage(context);
    }
    else if(query == alldata[2]){
      navigateToContacts(context);
    }
    else{
      navigateToNoSearch(context);
    }
  }

  void navigateToGuidePage(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Guide())
    );
  }
  void navigateToDetectionPage(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage())
    );
  }
  void navigateToContacts(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Contact())
    );
  }
   void navigateToNoSearch(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>noSearch())
    );
  }
 
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in alldata) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
            onTap: (){query = result;},
          );
        });
  } 
}
