import 'package:clean_architecture_movies_app/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

// no implementation here   contract only
abstract class BaseMovieRepository {

  Future<Either<Failure , List<MovieEntity> >>  getNowPlayingMovies();
  Future<Either<Failure , List<MovieEntity> >>getPopularMovies(); //  add release data in entity

  Future<Either<Failure , List<MovieEntity> >>  getTopRatedMovies();

}