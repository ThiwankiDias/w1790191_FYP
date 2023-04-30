// Developer name - ( H. Thiwanki Dias Hettiarachchi, UoW id - w1790191) 
// if the search item is not found app will navigate to this page 
import 'package:flutter/material.dart';
import 'custom_search.dart';

class noSearch extends StatefulWidget{
  @override
  _noSearchState createState()=> _noSearchState();

}

class _noSearchState extends State<noSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TYRE-DDR"),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearch());
              },
              icon: const Icon(Icons.search))
        ]),
        body: Center(child: Image.asset('assets/not_found.png',width: 250,height: 250,)),
    );
  }
}