import 'package:equatable/equatable.dart';

class MovieEntity  extends Equatable {
  final String overview;
  final int id;
  final String title;
  final double voteAverage;
  final List<int> genreIds;
  final String backdropPath;

  const MovieEntity(
  {
    required this.overview,
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.genreIds,
    required this.backdropPath
}
      );

  @override
  // TODO: implement props
  List<Object> get props =>[
    id,
    title,
    backdropPath,
    overview,
    genreIds,
    backdropPath
  ] ;

}
// movie  entity --> This is the data that I need from the movie

//  -- If we created two objects from the same entity with the same data,
//  and we checked if they are equal, it will print "no"
///That means each object has a different identifier. (different hashCode)

///  ^  xor  betwise    2 ^ 3 =  1
          //   how?     convert each a number for binary
          //            متشابهين ب صفر \ مختلفين ب 1



// Equatable package
