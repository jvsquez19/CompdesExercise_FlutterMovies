import 'movie_model.dart';

class MovieDetailModel extends MovieModel{

  String released;
  String runtime;
  String genre;
  String plot;
  String actors;
  String director;
  String awards;
  String imbdRating;

  MovieDetailModel(title,imdbID,poster,year,type,
      this.released, this.runtime,
      this.genre,this.plot, this.actors,
      this.director, this.awards, this.imbdRating):super(title,imdbID,poster,year,type){

  }

  MovieDetailModel.fromJason(Map<String,dynamic> parsedJson):super.fromJson(parsedJson){
    this.released = parsedJson["Released"];
    this.runtime = parsedJson["Runtime"];
    this.genre = parsedJson["Genre"];
    this.plot = parsedJson["Plot"];
    this.actors = parsedJson["Actors"];
    this.director = parsedJson["Director"];
    this.awards = parsedJson["Awards"];
    this.imbdRating = parsedJson["imdbRating"];
  }
}