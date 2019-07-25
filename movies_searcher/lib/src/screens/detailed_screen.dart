import 'package:flutter/material.dart';
import '../models/movie_detailed_model.dart';

class DetailScreen extends StatelessWidget {
  
  MovieDetailModel movie;

  final TextStyle titleStyle = TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.bold
  );

  final TextStyle infoStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold
  );
  
  DetailScreen(this.movie){}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: ListView(
        children: <Widget>[
          Container(padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              this.movie.poster != "N/A" ?
              Image.network(this.movie.poster):
              Icon(Icons.image),
              Chip(label: Text("Title", style: titleStyle),backgroundColor: Colors.lightBlue[200]),
              Text(movie.title, style: infoStyle),
              Chip(label: Text("Description", style: titleStyle),backgroundColor: Colors.lightBlue[200]),
              Text(movie.plot, style: infoStyle),
              Chip(label: Text("Awards", style: titleStyle),backgroundColor: Colors.lightBlue[200]),
              Text(movie.awards, style: infoStyle),
              Chip(label: Text("Director", style: titleStyle),backgroundColor: Colors.lightBlue[200]),
              Text(movie.director, style: infoStyle),
              Chip(label: Text("Actors", style: titleStyle),backgroundColor: Colors.lightBlue[200]),
              Text(movie.actors, style: infoStyle),
              Chip(label: Text("Release date", style: titleStyle),backgroundColor: Colors.lightBlue[200]),
              Text(movie.released, style: infoStyle),
              Chip(label: Text("Runtime", style: titleStyle),backgroundColor: Colors.lightBlue[200]),
              Text(movie.runtime, style: infoStyle),
              Chip(label: Text("Score", style: titleStyle),backgroundColor: Colors.lightBlue[200]),
              Text(movie.imbdRating, style: infoStyle),
            ],
          )),
        ],
      ),
    );
  }
}