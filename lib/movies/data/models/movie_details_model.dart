import 'package:clean_architecture_movies_app/movies/data/models/genres_model.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel  extends MovieDetailsEntity {
  const MovieDetailsModel(
  {required super.backDropPath, required super.id, required super.overView,
  required super.releaseDate, required super.runTime,
  required super.title, required super.voteAverage,
  required super.genres});


 factory MovieDetailsModel.fromJson( Map<String , dynamic >  json)  {
    return
MovieDetailsModel(backDropPath: json["backdrop_path"]??"",
    id: json["id"],
overView: json["overview"],
releaseDate: json["release_date"],
runTime: json["runtime"],
title: json["title"],
voteAverage: json["vote_average"].toDouble(),
genres: List<GenresModel>.from(json["genres"].map((e)=>GenresModel.fromjson(e)))
);
}


}