import 'package:clean_architecture_movies_app/movies/domain/entities/movie.dart';
import 'package:clean_architecture_movies_app/movies/domain/repository/base_movies_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

class GetPopularMoviesUseCase{


  final BaseMovieRepository  baseMovieRepository ;
  GetPopularMoviesUseCase( {
    required this.baseMovieRepository
  } );

  Future<Either<Failure , List<MovieEntity> >>execute() async {
    return   await  baseMovieRepository.getPopularMovies()   ;
  }

}