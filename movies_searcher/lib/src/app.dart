import 'package:flutter/material.dart';
import 'screens/search_screen.dart';

class App extends StatelessWidget{

@override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Movies Searcher",
    home: SearchScreen(),);
  }

}