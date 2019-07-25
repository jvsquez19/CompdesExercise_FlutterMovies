import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../models/movie_detailed_model.dart';
import '../mixins/http_service.dart';
import '../screens/detailed_screen.dart';

class MoviesList extends StatelessWidget with HttpService {
final List<MovieModel> images;

Future<MovieDetailModel> getMovieDetail(String id) async {
  final decodedArray = await makeQuery('http://www.omdbapi.com/?i=$id&apikey=2eba0a3b');
  if(decodedArray['Response'] == 'True'){
    return MovieDetailModel.fromJason(decodedArray);
  }
  return null;
}

void moveToDetailScreen(String id , BuildContext context) async{
  final movie = await getMovieDetail(id);
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DetailScreen(movie)));
}

MoviesList(this.images);

Widget build(context) {
return ListView.builder(
  itemCount: images.length,
  itemBuilder: (context, int index) {
     return buildMovie(images[index], context);
  }
);
}

buildMovie(MovieModel movie, BuildContext context){
  return GestureDetector(
    child: Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            trailing: Text(movie.type),
            leading: Icon(Icons.subdirectory_arrow_right),
            title: Text(movie.title),
            subtitle: Text(movie.year),
          ),
          movie.poster != "N/A" ?
          Image.network(movie.poster):
          Icon(Icons.image),

        ],
      ),
    ),
    onTap: (){moveToDetailScreen(movie.imdbID, context);},
  );
}


}