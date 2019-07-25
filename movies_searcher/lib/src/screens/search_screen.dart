import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../widgets/movies_list.dart';
import '../mixins/http_service.dart';


class SearchScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return SearchScreenState();
  }
}

class SearchScreenState extends State<SearchScreen> with HttpService{
  List<MovieModel> movies = [];

  void fetchMovies(String searchValue) async {
    movies.clear();
    final decodedArray = await makeQuery('http://www.omdbapi.com/?s=$searchValue&apikey=2eba0a3b');
    if(decodedArray['Response'] == 'True'){
      List found = decodedArray["Search"] as List;
      setState(() {
        found.map((dynamic element){
          movies.add(MovieModel.fromJson(element));
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Let's see some movies"),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: "Buscar",

            ),
            autocorrect: true,
            textAlign:TextAlign.start,
            onChanged: (String value){fetchMovies(value);},
          ),
          Expanded(
              child: MoviesList(movies)
          )

        ],
      ),
    );
  }

}