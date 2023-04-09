import '../../domain/entities/movie.dart';

class MovieModel extends MovieEntity {
 const  MovieModel(
      {required super.overview,
      required super.id,
      required super.title,
      required super.voteAverage,
      required super.genreIds,
      required super.backdropPath,
      required super.releaseDate}
      );

 factory MovieModel.fromJson(Map<String,dynamic> json) {
   return  MovieModel(
   overview: json["overview"] ,
   id:json["id"] ,
   title: json["title"],
   /// TODO : CHECK THIS
   voteAverage:json["vote_average"].toDouble(),
   genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
   backdropPath: json["backdrop_path"]??"",
   releaseDate: json["release_date"]
);

}

}

