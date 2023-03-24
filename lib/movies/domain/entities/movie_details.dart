import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetailsEntity extends Equatable {
  final String backDropPath;
  final  List< GenresEntity> genres ;
  final int id;
  final String overView;
  final String releaseDate;
  final int runTime;
  final String title;
  final double voteAverage;

 const  MovieDetailsEntity({
   required this.backDropPath,
 required   this.id,
 required   this.overView,
  required  this.releaseDate,
 required   this.runTime,
   required this.title,
  required  this.voteAverage,
  required this.genres
});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    releaseDate,
    title,
    backDropPath ,
    overView,
    voteAverage,
    genres
  ];
}