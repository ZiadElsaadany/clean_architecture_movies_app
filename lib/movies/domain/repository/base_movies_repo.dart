import 'package:clean_architecture_movies_app/movies/domain/entities/movie.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie_details.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/recommendation.dart';
import 'package:clean_architecture_movies_app/movies/domain/usecases/get_recommendation_use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../usecases/get_movie_details_use_case.dart';

// no implementation here   contract only
abstract class BaseMovieRepository {

  Future<Either<Failure , List<MovieEntity> >>  getNowPlayingMovies();
  Future<Either<Failure , List<MovieEntity> >>getPopularMovies(); //  add release data in entity

  Future<Either<Failure , List<MovieEntity> >>  getTopRatedMovies();
  Future<Either<Failure , MovieDetailsEntity>>  getMovieDetails(MovieDetailsParameters movieDetailsParams);
  Future<Either<Failure , List<RecommendationEntity>>>  getRecommendation({
   required  RecommendationParameter parameter
});

}